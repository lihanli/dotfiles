alias ll='ls -alFh'
alias lsg='ll | grep'
alias encrypt='gpg --cipher-algo AES256 -c'
# make less always work with colored input
alias less='less -R'
alias fr='find . -name'

# git aliases
alias g='git status'
alias ga='git add'
alias gaa='git add --all'
alias gk='git commit -m'
alias gsha='git rev-parse HEAD'
alias gfo='git fetch origin'
alias grhh='git reset --hard HEAD'
alias gl="git log --pretty=format:'%Cred%h%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gll='gl -p'
alias gs="git stash"
alias gsp="git stash pop"
alias gmo='git checkout --ours --'
alias gpu='git pull upstream master'
alias dep='hdep master'
alias gsc='git clone --depth=1'

alias current_branch='git rev-parse --abbrev-ref HEAD'
alias gout='git push origin'
alias gin='git pull --rebase origin'
alias ginc='gin $(current_branch)'
alias goutc='gout $(current_branch)'
alias gco='git checkout'
alias hdep='git push heroku'
alias gbd='git branch -D'
alias glb="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias gsu='git submodule update --init'
alias ctm='gds master $(current_branch)'
alias update_rbenv='cd ~/.rbenv && ginc && cd ~/.rbenv/plugins/ruby-build && ginc'

gaap() {
  if [[ $# -eq 0 ]]; then
    echo 'Missing commit msg'
    return 1
  fi

  echo -n "Commit and push '$1' to $(current_branch)? "
  read answer
  if [[ $answer != 'y' ]]; then
    echo 'Not committed'
    return 1
  fi

  gaa && gk $1 && goutc
}

# ruby aliases
rc() {
  if [[ -f "bin/$1" ]]; then
    eval "bin/$@"
  else
    eval "be $@"
  fi
}

tu() {
  if [[ -f "bin/spring" ]]; then
    eval "bin/spring testunit $@"
  else
    eval "be ruby -Itest $@"
  fi
}

alias be='bundle exec'
alias rake='rc rake'
alias sp='rc rspec -f d --color'
alias spf='sp --fail-fast'
alias tpre='rc rake db:test:prepare'
alias migrate='rc rake db:migrate db:test:prepare'
alias ir='rc rails s thin'
alias cu='rc cucumber --backtrace --format pretty'
alias rr='rc rails routes | eval $EDITOR -'
alias dm="rc rake db:migrate"
alias dmr="rc rake db:migrate:redo"
alias dmrd='rc rake db:rollback STEP=1'
alias rl='rc rubocop --display-cop-names --autocorrect -r rubocop-thread_safety'
alias load_test_schema='RAILS_ENV=test rake db:schema:load'
alias mo='ne mocha'

alias ,1=',timer 60'
alias ,2=',timer 120'
alias ,9=',timer 90'
