source $DOTFILES_CONFIGS_DIR/unix_gui.bash
unalias subl
export EDITOR='subl -n -w'

path_append '/usr/local/mysql/bin'
path_append '/Applications/Postgres.app/Contents/MacOS/bin'
path_append '/Applications/Postgres93.app/Contents/MacOS/bin'

alias fdns='sudo killall -HUP mDNSResponder'
