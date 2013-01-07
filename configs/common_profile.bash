path_append ()  { path_remove $1; export PATH="$PATH:$1"; }
path_prepend () { path_remove $1; export PATH="$1:$PATH"; }
path_remove ()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; }

# init rbenv if installed
rbenv_dir="$HOME/.rbenv"
if [ -d $rbenv_dir ]; then
	path_append $rbenv_dir/bin
	eval "$(rbenv init -)"
fi

for path in 'node_modules/.bin' 'scripts' 'dotfiles/scripts'; do
	path_append $HOME/$path
done

if [[ $OSTYPE =~ ^darwin.*$ ]]; then
	source ~/.osx.bash
else
	alias upgrade='sudo apt-get update && sudo apt-get upgrade'
	export EDITOR='vi'
fi

# general aliases
alias lsg='ll | grep'

# git aliases
alias g='git status'
alias ga='git add'
alias gd="git diff | $EDITOR -"
alias gdc="ga .; git diff --cached | $EDITOR -"
alias gk='git commit -m'
alias gsha='git rev-parse HEAD'
alias gfo='git fetch origin'
alias grhh='git reset --hard HEAD'

alias gout='git push origin'
alias gin='git pull origin'
alias gco='git checkout'
alias hdep='git push heroku'

alias dep='gout master && hdep master'

for cmd in "gout gin gco hdep"; do
	complete -o bashdefault -o default -o nospace -F _gitk $cmd
done

# ruby aliases
alias be='bundle exec'
alias drb='be rspec --drb --fail-fast -f d'
alias migrate='be rake db:migrate && be rake db:test:prepare'
alias ispec='be rspec --fail-fast -f d'
alias tu='be ruby -Itest'
alias ir='be rails s thin'

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	PS1_PREFIX='\[$(tput setaf 2)\]\u\[$(tput sgr0)\]:'
fi
PS1=${PS1_PREFIX}'\[$(tput setaf 6)\]\w$(parse_git_branch)> \[$(tput sgr0)\]'
