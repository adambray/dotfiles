#freshshell.com - integrate other shell files
source ~/.fresh/build/shell.sh

export CDPATH=.:~:~/Links:~/code/:~/code/stc/

# Textmate
export EDITOR='/usr/local/bin/subl'

# For Oracle on Navicat
# export DYLD_LIBRARY_PATH="/usr/local/oracle/instantclient_10_2"
export SQLPATH="/usr/local/oracle/instantclient_10_2"
export TNS_ADMIN="/usr/local/oracle/network/admin"
export NLS_LANG="AMERICAN_AMERICA.UTF8"
# export PATH=$PATH:$DYLD_LIBRARY_PATH

# ImageMagik
export MAGICK_HOME="/usr/local/ImageMagick-6.5.1"
export PATH="$MAGICK_HOME/bin:$PATH"
#export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib:$DYLD_LIBRARY_PATH"

# Tab-completion for Git.
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
. `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
    . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
fi

# show branch and dirty status
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "⚡"
}
function parse_git_branch {
  local branch=$(__git_ps1 "%s")
  [[ $branch ]] && echo "[$branch$(parse_git_dirty)]"
}

#Old Prompt
#PS1='\h:\W$(__git_ps1 "(%s)") \u\$ '

# Modifies my bash prompt to show current path, git branch and timestamp (useful to know when you run what command)
export PS1='\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(parse_git_branch)   ҈ \t\n$ '

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

alias dep_res_all='cap deploy DOMAIN=ulua.its.yale.edu PREFIX=bmec BRANCH=master && cap deploy DOMAIN=ulua.its.yale.edu PREFIX=forestry BRANCH=master && cap deploy DOMAIN=ulua.its.yale.edu PREFIX=stc-loaners BRANCH=master'

#################
# Bash Settings #
#################

# I like color :)
export CLICOLOR=1
export TERM=xterm-color

# Bash history is appended not overwritten
shopt -s histappend
# Store more lines of history
unset HISTFILESIZE
HISTSIZE=1000000
# Don't store dupes, and ignore lines starting with space and other common commands
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
# Timestamp
HISTTIMEFORMAT='%F %T '
# Store history immediately
PROMPT_COMMAND='history -a; history -n'
# Turn of XON/XOFF Flow Control
stty -ixon

# RBenv and other apps in path
export PATH="$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$HOME/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# open man pages in Preview.app
if [ -d "/Applications/Preview.app" ]
then
  pman () {
    man -t "$@" |
    ( which ps2pdf > /dev/null && ps2pdf - - || cat) |
    open -f -a /Applications/Preview.app
  }
fi

# add a poor facsimile for Linux's `free` if we're on Mac OS
if ! type free > /dev/null 2>&1 && [[ "$(uname -s)" == 'Darwin' ]]
then
  alias free="top -s 0 -l 1 -pid 0 -stats pid | grep '^PhysMem: ' | cut -d : -f 2- | tr ',' '\n'"
fi

# load Homebrew's shell completion
if which brew > /dev/null && [ -f "$(brew --prefix)/Library/Contributions/brew_bash_completion.sh" ]
then
  source "$(brew --prefix)/Library/Contributions/brew_bash_completion.sh"
fi