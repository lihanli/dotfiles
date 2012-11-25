export PATH=$PATH:/usr/local/mysql/bin
alias gd='git diff | subl -n'
alias gdc='ga .; git diff --cached | subl -n'

# enable colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

# sets up proper alias commands when called
alias ls='ls -G'
alias ll='ls -hl -la'

alias fdns='sudo killall -HUP mDNSResponder'

# add keys to agent by default
ssh-add