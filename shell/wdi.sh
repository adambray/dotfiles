#### General Assemb.ly/WDI Stuff

# A function that jumps to a particular wk/day folder in the class repo

export WDI_PATH=$CODE_PATH/general_assembly/wdi/

# Students can add a shortcut to quickly access their GA folder
# example: alias wdi="cd ~/Documents/GA/WDI4"

alias wdi="cd $WDI_PATH"
alias tender="cd $WDI_PATH/tender_touches"
alias students="cd $WDI_PATH/students"

cdhwfunc() {
  # takes three args: the week, the day
  # and an optional third for the user
  if [ $1 -lt 10 ]
  then
    cd ~/code/general_assembly/wdi/WDI_NYC_12_Students/w0$1/d0$2/${3:-Instructor}
  else
    cd ~/dev/wdi/WDI_NYC_12_Students/w$1/d0$2/${3:-Instructor}
  fi
}
alias cdhw=cdhwfun
