source $DOTFILES_CONFIGS_DIR/unix_gui.bash
export EDITOR='subl -n -w'

path_prepend '/usr/local/bin'

path_append '/usr/local/mysql/bin'
path_append '/Applications/Postgres.app/Contents/MacOS/bin'
path_append '/Applications/Postgres93.app/Contents/MacOS/bin'

# TODO git zsh completion

alias fdns='sudo killall -HUP mDNSResponder'
