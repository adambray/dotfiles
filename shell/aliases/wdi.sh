
#### General Assemb.ly/WDI Stuff

# A function that jumps to a particular wk/day folder in the class repo

function wdi() {
  local WEEK_NUM=$1
  local DAY_NUM=$2
  local BASE_PATH="$WDI_PATH/wdi-lambda/WDI_NYC_Lambda"
  if [ "$WEEK_NUM" != "" ] && [ "$DAY_NUM" != "" ]
  then
    local WEEK_STRING="/w$WEEK_NUM"
    local DAY_STRING="/d$DAY_NUM"
    if [ -e $BASE_PATH$WEEK_STRING$DAY_STRING ]
  	then
      cd $BASE_PATH$WEEK_STRING$DAY_STRING;
    else
      cd $WDI_PATH/wdi-lambda/
    fi
  else
    if [ "$WEEK_NUM" == "class" ]
      then cd $WDI_PATH/wdi-lambda/WDI_NYC_Lambda
    elif [ "$WEEK_NUM" == "curriculum" ]
      then cd $WDI_PATH/wdi-lambda/WDI_Curriculum
   else
      cd $WDI_PATH/wdi-lambda/
    fi
  fi
}