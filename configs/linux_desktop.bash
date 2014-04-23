source $DOTFILES_CONFIGS_DIR/unix_gui.bash

alias subl='st'
export EDITOR='subl -n'

function pipe_into_editor() {
  tmp_file="$HOME/tmp.txt"
  $@ > $tmp_file
  eval ${EDITOR} $tmp_file
}

alias gd="pipe_into_editor git diff"
alias gdc="ga --all .; pipe_into_editor git diff --cached"
