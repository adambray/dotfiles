# Git aliases
alias git=hub
alias ga='git add'
alias gc='git commit'
alias gg='git'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gg='git grep'
alias gm='git merge'
alias gs='git status'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias shifts='cd ~/code/stc/shifts && subl .'
alias resv='cd ~/code/stc/reservations && subl .'

alias rs='rails server'
alias rc='rails console'
alias ra='bundle exec rake assets:precompile'

alias dep_res_all='cap deploy DOMAIN=ulua.its.yale.edu PREFIX=bmec BRANCH=master && cap deploy DOMAIN=ulua.its.yale.edu PREFIX=forestry BRANCH=master && cap deploy DOMAIN=ulua.its.yale.edu PREFIX=stc-loaners BRANCH=master && cap deploy DOMAIN=ulua.its.yale.edu PREFIX=bmec-training BRANCH=master && cap deploy DOMAIN=ulua.its.yale.edu PREFIX=dmca BRANCH=master && cap deploy DOMAIN=ulua.its.yale.edu PREFIX=uof BRANCH=master && cap deploy DOMAIN=ulua.its.yale.edu PREFIX=ycc_bikes BRANCH=master'

alias dep_shifts_all='cap deploy DOMAIN=weke.its.yale.edu PREFIX=apps2 BRANCH=master && cap deploy DOMAIN=weke.its.yale.edu PREFIX=acr BRANCH=master && cap deploy DOMAIN=weke.its.yale.edu PREFIX=fsc BRANCH=master && cap deploy DOMAIN=weke.its.yale.edu PREFIX=mediaservices BRANCH=master && cap deploy DOMAIN=weke.its.yale.edu PREFIX=ssrs BRANCH=master && cap deploy DOMAIN=weke.its.yale.edu PREFIX=stcdev BRANCH=master && cap deploy DOMAIN=weke.its.yale.edu PREFIX=stc_training BRANCH=master'

alias ctags='/usr/local/bin/ctags'
