source $DOTFILES_CONFIGS_DIR/unix_gui.bash
export EDITOR='subl -n -w'

path_prepend '/usr/local/bin'

path_append '/usr/local/mysql/bin'
path_append '/Applications/Postgres.app/Contents/MacOS/bin'
path_append '/Applications/Postgres93.app/Contents/MacOS/bin'

# TODO git zsh completion

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
