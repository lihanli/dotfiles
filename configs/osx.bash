path_append '/usr/local/mysql/bin'
path_append '/Applications/Postgres.app/Contents/MacOS/bin'
path_append '/Applications/Postgres93.app/Contents/MacOS/bin'

# don't use apple's version of git
git_dir='/usr/local/git'
path_prepend $git_dir/bin
source $git_dir/contrib/completion/git-completion.bash

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

export EDITOR='subl -w -n'

# rails secret token (only use in development env)
export SECRET_TOKEN='e809a0d9ef130a5f07630655e6b3ca15f3eef3a2de38d3de68857972237f204ed5022507ae3340c03570cf92e81eb8fc9b619b87a50d9ad7ae335b56c28f0438'
