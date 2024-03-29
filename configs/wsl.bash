alias subl='subl_wsl'

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

function spf_wsl {
  spf $(convert_windows_slashes $1)
}

function gds {
  pipe_into_editor git diff $1..$2
}

function open_common_docs() {
  subl

  if ! [ -n "$WINDOWS_USER" ]; then
    WINDOWS_USER=`cmd.exe /c "echo %USERNAME%"`
    WINDOWS_USER=$(echo $WINDOWS_USER|tr -d '\r\n')
  fi

  declare -a arr=(
    "C:\Users\\$WINDOWS_USER\My Drive\files\documents\mfd.txt"
    "C:\Users\\$WINDOWS_USER\My Drive\files\documents\todo.txt"
    "C:\Users\\$WINDOWS_USER\My Drive\files\sysadmin\norgate update.txt"
  )

  for i in "${arr[@]}"
  do
    /mnt/c/Program\ Files/Sublime\ Text/sublime_text.exe "$i" >/dev/null 2>&1 &
  done
}

# connect network drive
if ! powershell.exe -c "dir z:" >/dev/null 2>&1; then
  powershell.exe -c "explorer z:"
fi
