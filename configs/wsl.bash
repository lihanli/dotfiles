function subl() {
  nohup /mnt/c/Program\ Files/Sublime\ Text/sublime_text.exe -n "$(convert_linux_path $1)" >/dev/null 2>&1 &
}

WSL_PREFIX='\\wsl$\Ubuntu-'
VERSION=$(lsb_release -a 2> /dev/null | grep Release | awk -F ' ' '{print $NF}')
export WSL_PATH_PREFIX="$WSL_PREFIX$VERSION"

function pipe_into_editor() {
  tmp_file="$HOME/tmp.txt"
  $@ > $tmp_file
  subl $tmp_file
}

alias gd="pipe_into_editor git diff"
alias gdc="ga --all .; pipe_into_editor git diff --cached"
alias rr='pipe_into_editor rc rails routes'

unalias spf
function spf() {
  sp --fail-fast $(convert_windows_path $1)
}

function gds {
  pipe_into_editor git diff $1..$2
}
