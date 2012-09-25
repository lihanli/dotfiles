export PATH=$PATH:/usr/local/mysql/bin
alias gd='git diff | subl -n'
alias gdc='ga .; git diff --cached | subl -n'

#enables color in the terminal bash shell export
CLICOLOR=1
#sets up the color scheme for list export
LSCOLORS=gxfxcxdxbxegedabagacad
#enables color for iTerm
export TERM=xterm-color
#sets up proper alias commands when called
alias ls='ls -G'
alias ll='ls -hl -la'