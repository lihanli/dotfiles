function path_remove {
  cleanpath=$(echo $PATH |
              tr ':' '\n' |
              awk '{a[$0]++;if (a[$0]==1){b[max+1]=$0;max++}}END{for (x = 1; x <= max; x++) { print b[x] } }' |
              grep -v $1 |
              tr '\n' ':' |
              sed -e 's/:$//')

  export PATH=$cleanpath
}

function path_append ()  {
  path_remove $1
  export PATH=$PATH:$1
}

function path_prepend {
  path_remove $1
  export PATH=$1:$PATH
}

dotfiles_dir=~/dotfiles
source $dotfiles_dir/functions/util.bash
source $dotfiles_dir/functions/util.zsh

# init rbenv if installed
rbenv_dir="$HOME/.rbenv"
if [ -d $rbenv_dir ]; then
  path_append $rbenv_dir/bin
  eval "$(rbenv init -)"
fi

# heroku toolbelt
heroku_dir='/usr/local/heroku/bin'
[[ -d $heroku_dir ]] && path_append $heroku_dir

path_prepend /usr/local/bin

for new_path in 'node_modules/.bin' 'scripts' 'dotfiles/scripts'; do
  path_append $HOME/$new_path
done

# os specific config
export DOTFILES_CONFIGS_DIR=$dotfiles_dir/configs

os=$(os_detect)
case $os in
  osx)
    source $DOTFILES_CONFIGS_DIR/osx.bash
    source $DOTFILES_CONFIGS_DIR/git_diff_pipes.bash;;
  ubuntu-desktop)
    source $DOTFILES_CONFIGS_DIR/linux_desktop.bash;;
  ubuntu-server)
    export EDITOR='vi'
    source $DOTFILES_CONFIGS_DIR/git_diff_pipes.bash;;
esac

# turn on vimode
bindkey -v
# reduce command mode timeout
export KEYTIMEOUT=5
# turn off automatic matching of ~/ directories (speeds things up)
setopt no_cdable_vars
# case insensitive matching when performing filename expansion
setopt no_case_glob
# leave nohup jobs running
setopt NO_HUP
# bash style comments
setopt interactivecomments

# zsh history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=${HISTSIZE}
# import new commands from history (mostly)
setopt share_history
# reduce unnecessary blanks from commands being written to history
setopt hist_reduce_blanks
# if a new command line being added to the history list duplicates an older one, the older command is removed from the list
setopt hist_ignore_all_dups
# multiple zsh sessions will append to the same history file (incrementally, after each command is executed)
setopt inc_append_history
# purge duplicates first
setopt hist_expire_dups_first
# make some commands not show up in history
export HISTIGNORE="ls:ll:cd:cd -:pwd:exit:date:* --help"

# colors
autoload -U colors
colors

# colored ls (one version for GNU, other for Mac OS X)
if whence dircolors > /dev/null; then
  eval "`dircolors -b`"
  alias ls='ls --color=auto'
else
  export CLICOLOR=1
fi

# colored grep
export GREP_COLOR='31'
export GREP_OPTIONS='--color=auto'

# zsh will not beep
setopt no_beep

source $DOTFILES_CONFIGS_DIR/prompt.zsh
source $DOTFILES_CONFIGS_DIR/key_bindings.zsh

source $DOTFILES_CONFIGS_DIR/aliases.sh
source $DOTFILES_CONFIGS_DIR/functions.sh
# git completion for gin
compdef _git gin=git-pull
# ubuntu specific alias
[[ $os =~ ^ubuntu.*$ ]] && alias upgrade='sudo apt-get update && sudo apt-get upgrade'

[[ -f $DOTFILES_CONFIGS_DIR/custom.zsh ]] && source $DOTFILES_CONFIGS_DIR/custom.zsh

export PATH