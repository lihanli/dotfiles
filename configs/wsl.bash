function subl() {
  nohup /mnt/c/Program\ Files/Sublime\ Text/sublime_text.exe -n "$(convert_linux_path $1)" >/dev/null 2>&1 &
}

function subl_win_path() {
  nohup /mnt/c/Program\ Files/Sublime\ Text/sublime_text.exe "$1" >/dev/null 2>&1 &
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

function open_common_docs() {
  subl
  sleep 2
  subl_win_path 'C:\Users\lihan\Google Drive\files\documents\mfd.txt'
  subl_win_path 'C:\Users\lihan\Google Drive\files\documents\todo.txt'
  subl_win_path 'C:\Users\lihan\Google Drive\files\sysadmin\norgate update.txt'
}
