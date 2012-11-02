GC="$HOME/git-completion.bash"

[ -f $GC ] && source $GC

for path in '/node_modules/.bin' '/scripts' '/dotfiles/scripts'
do
	export PATH=$PATH:$HOME$path
done

# git aliases
alias g='git status'
alias ga='git add'
alias gd='git diff'
alias gk='git commit -m'
alias gsha='git rev-parse HEAD'
alias gfo='git fetch origin'
alias grhh='git reset --hard HEAD'
alias gdc='git diff --cached'

alias gout='git push origin'
alias gin='git pull origin'
alias gco='git checkout'
alias hdep='git push heroku'

for cmd in gout gin gco hdep
do
	complete -o bashdefault -o default -o nospace -F _gitk $cmd
done

alias drb='rspec --drb --fail-fast -f d'
alias migrate='rake db:migrate && rake db:test:prepare'
alias be='bundle exec'
alias ispec='be rspec --fail-fast -f d'
alias tu='ruby -Itest'
alias lsg='ll | grep'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="\\[$(tput setaf 7)\\]\\w\$(parse_git_branch)> \\[$(tput sgr0)\\]"

[[ $OSTYPE =~ ^darwin.*$ ]] && source .osx.bash