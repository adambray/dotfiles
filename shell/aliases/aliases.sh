# Git aliases
alias git=hub
alias gb='git branch'
alias gdc='git diff --cached'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias shifts='cd ~/code/stc/shifts && subl .'
alias resv='cd ~/code/stc/reservations && subl .'

function dep_res {
  OPTIONS="all bmec bmec-training stc-loaners forestry event_management uoc ycc_bikes dmca"
  select opt in $OPTIONS; do
      if [ "$opt" = "all" ]; then
        for opt in $OPTIONS; do
          if [ "$opt" != "all" ]; then
            `cap deploy DOMAIN=ulua.its.yale.edu PREFIX=$opt BRANCH=master`
            `cap deploy:migrate DOMAIN=ulua.its.yale.edu PREFIX=$opt BRANCH=master`
          fi
        done
        exit
      else
        `cap deploy DOMAIN=ulua.its.yale.edu PREFIX=$opt BRANCH=master`
        `cap deploy:migrate DOMAIN=ulua.its.yale.edu PREFIX=$opt BRANCH=master`
        exit
      fi
  done
}

alias dep_shifts_all='cap deploy DOMAIN=weke.its.yale.edu PREFIX=apps2 BRANCH=master && cap deploy DOMAIN=weke.its.yale.edu PREFIX=acr BRANCH=master && cap deploy DOMAIN=weke.its.yale.edu PREFIX=fsc BRANCH=master && cap deploy DOMAIN=weke.its.yale.edu PREFIX=mediaservices BRANCH=master && cap deploy DOMAIN=weke.its.yale.edu PREFIX=ssrs BRANCH=master && cap deploy DOMAIN=weke.its.yale.edu PREFIX=stcdev BRANCH=master && cap deploy DOMAIN=weke.its.yale.edu PREFIX=stc_training BRANCH=master'

alias ctags='/usr/local/bin/ctags'