# result of last command displays either happy or sad face as a prompt
smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

# vim mode indicator in prompt (http://superuser.com/questions/151803/how-do-i-customize-zshs-vim-mode)
vim_ins_mode="%{$fg[cyan]%}[INS]%{$reset_color%}"
vim_cmd_mode="%{$fg[green]%}[CMD]%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode indicator, while in fact you would be in INS mode
# Fixed by catching SIGINT (C-c), set vim_mode to INS and then repropagate the SIGINT, so if anything else depends on it, we will not break it
# Thanks Ron! (see comments)
function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
}

# don't display RPROMPT for previously accepted lines; only display it next to current line
setopt transient_rprompt

function ssh_prompt_color() {
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    echo '%{%F{blue}%}'
  else
    echo '%{%F{green}%}'
  fi
}

function background_jobs() {
  [[ $(jobs -l | wc -l) -gt 0 ]] && echo "⚙"
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PROMPT='${vim_mode} %(!.%{$fg[red]%}.%{$fg[green]%})%n$(ssh_prompt_color)@%m%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%}$(parse_git_branch)
${smiley} > '

RPROMPT='%{$fg[white]%}%T%{$reset_color%}'