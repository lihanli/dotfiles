source $DOTFILES_CONFIGS_DIR/unix_gui.bash

function pipe_into_editor() {
  tmp_file="$HOME/tmp.txt"
  $@ > $tmp_file
  $EDITOR $tmp_file
}

function subl() {
  nohup '/opt/Sublime Text 2/sublime_text' $@ > /dev/null 2>&1 &
}

alias gd="pipe_into_editor git diff"
alias gdc="ga --all .; pipe_into_editor git diff --cached"