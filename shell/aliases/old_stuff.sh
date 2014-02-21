# This is old stuff that I don't use anymore. Kept around because I don't want
# to bother searching though git for this.



# alias shifts='cd ~/code/stc/shifts && subl .'
# alias resv='cd ~/code/stc/reservations && subl .'

# function dep_res {
#   OPTIONS="all bmec bmec-training stc-loaners forestry event_management uoc ycc_bikes dmca"
#   select opt in $OPTIONS; do
#       if [ "$opt" = "all" ]; then
#         for opt in $OPTIONS; do
#           if [ "$opt" != "all" ]; then
#             `cap deploy DOMAIN=ulua.its.yale.edu PREFIX=$opt BRANCH=master`
#             `cap deploy:migrate DOMAIN=ulua.its.yale.edu PREFIX=$opt BRANCH=master`
#           fi
#         done
#         break
#       else
#         `cap deploy DOMAIN=ulua.its.yale.edu PREFIX=$opt BRANCH=master`
#         `cap deploy:migrate DOMAIN=ulua.its.yale.edu PREFIX=$opt BRANCH=master`
#         break
#       fi
#   done
# }

# function dep_shifts {
#   OPTIONS="all acr apps2 fsc mediaservices ssrs stcdev stc_training"
#   select opt in $OPTIONS; do
#       if [ "$opt" = "all" ]; then
#         for opt in $OPTIONS; do
#           if [ "$opt" != "all" ]; then
#             `cap deploy DOMAIN=weke.its.yale.edu PREFIX=$opt BRANCH=rails2_master`
#             `cap deploy:migrate DOMAIN=weke.its.yale.edu PREFIX=$opt BRANCH=rails2_master`
#           fi
#         done
#         break
#       else
#         `cap deploy DOMAIN=weke.its.yale.edu PREFIX=$opt BRANCH=rails2_master`
#         `cap deploy:migrate DOMAIN=weke.its.yale.edu PREFIX=$opt BRANCH=rails2_master`
#         break
#       fi
#   done
# }

# alias ctags='/usr/local/bin/ctags'
