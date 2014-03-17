path_append ()  { path_remove $1; export PATH="$PATH:$1"; }
path_prepend () { path_remove $1; export PATH="$1:$PATH"; }
path_remove ()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; }

dotfiles_dir=~/dotfiles
source $dotfiles_dir/functions/util.bash

# init rbenv if installed
rbenv_dir="$HOME/.rbenv"
if [ -d $rbenv_dir ]; then
  path_append $rbenv_dir/bin
  eval "$(rbenv init -)"
fi

path_prepend /usr/local/bin

for path in 'node_modules/.bin' 'scripts' 'dotfiles/scripts'; do
  path_append $HOME/$path
done

# add git bash completion
if [ -d '/usr/share/bash-completion' ]; then
  source /usr/share/bash-completion/completions/git
fi

# general aliases
alias lsg='ll | grep'
alias encrypt='gpg --cipher-algo AES256 -c'

# git aliases
alias g='git status'
alias ga='git add'
alias gk='git commit -m'
alias gsha='git rev-parse HEAD'
alias gfo='git fetch origin'
alias grhh='git reset --hard HEAD'
alias gl="git log --pretty=format:'%Cred%h%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gs="git stash"
alias gsp="git stash pop"
alias gmo='git checkout --ours --'
alias gpu='git pull upstream master'
alias dep='gout master && hdep master'

alias gout='git push origin'
alias gin='git pull --rebase origin'
alias gco='git checkout'
alias hdep='git push heroku'
alias gbd='git branch -D'

for cmd in "gout gin gco hdep gbd"; do
  complete -o bashdefault -o default -o nospace -F _gitk $cmd
done

# ruby aliases
alias be='bundle exec'
alias drb='be rspec --drb --fail-fast -f d'
alias tpre='be rake db:test:prepare'
alias migrate='be rake db:migrate && tpre'
alias ispec='be rspec --fail-fast -f d'
alias tu='be ruby -Itest'
alias ir='be rails s thin'

# os specific config
export DOTFILES_CONFIGS_DIR=$dotfiles_dir/configs

os=`os_detect`
case $os in
  osx)
    source $DOTFILES_CONFIGS_DIR/osx.bash
    source $DOTFILES_CONFIGS_DIR/git_diff_pipes.bash;;
  ubuntu-desktop)
    source $DOTFILES_CONFIGS_DIR/linux_desktop.bash;;
  ubuntu-server)
    export EDITOR='vi'
    source $DOTFILES_CONFIGS_DIR/git_diff_pipes.bash;;
esac
[[ $os =~ ^ubuntu.*$ ]] && alias upgrade='sudo apt-get update && sudo apt-get upgrade'

# ps1 prefix
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  PS1_PREFIX='\[$(tput setaf 2)\]\u\[$(tput sgr0)\]:'
fi
PS1=${PS1_PREFIX}'\[$(tput setaf 6)\]\w$(parse_git_branch)> \[$(tput sgr0)\]'
