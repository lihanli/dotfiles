source $DOTFILES_CONFIGS_DIR/unix_gui.bash

function pipe_into_editor() {
  tmp_file="$HOME/tmp.txt"
  $@ > $tmp_file
  subl -n $tmp_file
}

alias gd="pipe_into_editor git diff"
alias gdc="ga --all .; pipe_into_editor git diff --cached"
alias chrome='google-chrome'
alias rr='pipe_into_editor rc rake routes'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

function gds {
  pipe_into_editor git diff $1..$2
}
