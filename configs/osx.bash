source $DOTFILES_CONFIGS_DIR/unix_gui.bash

path_append '/usr/local/mysql/bin'
path_append '/Applications/Postgres.app/Contents/MacOS/bin'
path_append '/Applications/Postgres93.app/Contents/MacOS/bin'

# use brew git if installed
git_dir='/usr/local/git'

if [ -d $git_dir ]; then
  path_prepend $git_dir/bin
  source $git_dir/contrib/completion/git-completion.bash
fi

# enable colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

# sets up proper alias commands when called
alias ls='ls -G'
alias ll='ls -hl -la'

alias fdns='sudo killall -HUP mDNSResponder'
