#### General Assemb.ly/WDI Stuff

export GA_CLASS_NAME=wdi-dc-6
export CLASS_NAME=wdi-dc-6

export WDI_PATH="$CODE_PATH/work/general_assembly/courses/wdi"

tender="$WDI_PATH/nyc/map_feb_2014/tender_touches"
hamco="$WDI_PATH/nyc/closure_jun_2014/hamco"
students="$WDI_PATH/dc/dc5/students"
instructors="$WDI_PATH/dc/dc5/instructors"
mac="$WDI_PATH/dc/dc5/milk-and-cookies"
pbj="$WDI_PATH/dc/dc6/pbj"
hw="$WDI_PATH/dc/hw"


alias wdi="cd $WDI_PATH"
alias tender="cd $tender"
alias hamco="cd $hamco"
alias students="cd $students"
alias instructors="cd $instructors"
alias mac="cd $mac"
alias pbj="cd $pbj"
alias hw="cd $hw"

# A function that jumps to a particular wk/day folder in the class repo
# cdhwfunc() {
#   # takes three args: the week, the day
#   # and an optional third for the user
#   if [ $1 -lt 10 ]
#   then
#     cd $students/w0$1/d0$2/${3:-INSTRUCTOR}*
#   else
#     cd $students/w$1/d0$2/${3:-INSTRUCTOR}*
#   fi
# }
# alias cdhw=cdhwfunc

# cpr() {
#   # Checks out a Pull Request
#   # usage: cpr pull_request_id
#   git fetch origin
#   git checkout pr/$1
# }

alias wdibuzz="_wdibuzz(){ curl \"http://wdi-dc-buzzer.herokuapp.com/api/buzz/do/Team%20Eskimo%20Kisses/$(whoami | xargs)_$(ifconfig | grep ether | head -1 | sed 's/[[:space:]|:|ether]*//g')/\$1\" --silent | sed 's/[[:space:]]$//g';return; }; _wdibuzz"
