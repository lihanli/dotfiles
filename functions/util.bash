os_detect() {
  if [[ $OSTYPE =~ ^darwin.*$ ]]; then
    echo 'osx'
  else
    if [[ $(uname -r) =~ ^.*icrosoft.*$ ]]; then
      echo 'wsl'
      return
    fi

    dpkg -l xorg > /dev/null 2>&1

    if [[ $? == 0 ]]; then
      echo 'ubuntu-desktop'
    else
      echo 'ubuntu-server'
    fi
  fi
}
