alias subl='/mnt/c/Program\ Files/Sublime\ Text/sublime_text.exe'

function pipe_into_editor() {
  tmp_file="$HOME/tmp.txt"
  $@ > $tmp_file
  PREFIX='\\wsl$\Ubuntu-'
  VERSION=$(lsb_release -a 2> /dev/null | grep Release | awk -F ' ' '{print $NF}')
  subl -n "$PREFIX$VERSION\home\\$(whoami)\tmp.txt"
}

alias gd="pipe_into_editor git diff"
alias gdc="ga --all .; pipe_into_editor git diff --cached"
alias rr='pipe_into_editor rc rails routes'

function gds {
  pipe_into_editor git diff $1..$2
}
