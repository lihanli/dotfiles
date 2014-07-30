alias ll='ls -alF'
alias lsg='ll | grep'
alias encrypt='gpg --cipher-algo AES256 -c'
# make less always work with colored input
alias less='less -R'

# git aliases
alias g='git status'
alias ga='git add'
alias gaa='git add --all'
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

# ruby aliases
alias be='bundle exec'
alias drb='be rspec --drb --fail-fast -f d'
alias tpre='be rake db:test:prepare'
alias migrate='be rake db:migrate db:test:prepare'
alias ispec='be rspec --fail-fast -f d'
alias tu='be ruby -Itest'
alias ir='be rails s thin'
alias cu='be cucumber --backtrace --format pretty'
alias rr="be rake routes | $EDITOR -"
alias dm="be rake db:migrate"
alias dmr="be rake db:migrate:redo"
