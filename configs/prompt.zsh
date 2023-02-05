# parameter expansion, command substitution and arithmetic expansion are performed in prompts
setopt prompt_subst
# result of last command displays either happy or sad face as a prompt
smiley="%(?,%{$fg[green]%}:)%{$reset_color%},%{$fg[red]%}:(%{$reset_color%})"

# don't display RPROMPT for previously accepted lines; only display it next to current line
setopt transient_rprompt

function ssh_prompt_color() {
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    echo '%{%F{yellow}%}'
  else
    echo '%{%F{green}%}'
  fi
}

function git_branch_name() {
  local branch_name="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
  [[ -n $branch_name ]] && echo "$branch_name"
}

function git_repo_status(){
  local rs="$(git status --porcelain -b)"

  if $(echo "$rs" | grep -v '^##' &> /dev/null); then # is dirty
    echo "%{$fg[red]%}"
  elif $(echo "$rs" | grep '^## .*diverged' &> /dev/null); then # has diverged
    echo "%{$fg[red]%}"
  elif $(echo "$rs" | grep '^## .*behind' &> /dev/null); then # is behind
    echo "%{[38;5;011m%}%}"
  elif $(echo "$rs" | grep '^## .*ahead' &> /dev/null); then # is ahead
    echo "%{$reset_color%}"
  else # is clean
    echo "%{$fg[green]%}"
  fi
}

function prompt_git() {
  local bname=$(git_branch_name)
  if [[ -n $bname ]]; then
    local infos="$(git_repo_status)$bname%{$reset_color%}"
    echo "|$infos"
  fi
}

PROMPT='$(ssh_prompt_color)%n@%m%{$reset_color%}|%{$fg_bold[cyan]%}%~%{$reset_color%}$(prompt_git)
${smiley} > '
