os_detect() {
  if [[ $OSTYPE =~ ^darwin.*$ ]]; then
    echo 'osx'
  else
    dpkg -l xorg > /dev/null 2>&1

    if [[ $? == 0 ]]; then
      echo 'ubuntu-desktop'
    else
      echo 'ubuntu-server'
    fi
  fi
}
