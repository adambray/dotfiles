# Start in code dir by default
# cd ~/code

# Private environment variables
source ~/.environment

# Easy 'cd' to common dirs
export CDPATH=.:~:~/code/:~/code/stc/:~/code/personal:~/code/general_assembly

# Node Path
export NODE_PATH='/usr/local/lib/node_modules/'

# Atom
export EDITOR='atom -w'
export ATOM_PATH="/opt/homebrew-cask/Caskroom/atom/latest/"

# ImageMagik
export MAGICK_HOME="/usr/local/ImageMagick-6.5.1"
export PATH="$MAGICK_HOME/bin:$PATH"

# EC2 Tools
# export JAVA_HOME=$(/usr/libexec/java_home)
export EC2_HOME="/usr/local/ec2-api-tools-1.6.11.0"
export PATH=$PATH:$EC2_HOME/bin

export PATH="/usr/local/share/npm/bin:$PATH"
export CODE_PATH=$HOME/code

# go programming language
export GOPATH=/usr/local/Cellar/go/
export PATH=$PATH:$GOPATH/bin

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

function fancy_shell {
  # Prompt shows current path, git branch and timestamp (useful to know when you run what command)
  export PS1='\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(prompt_git)   ҈ \n$ '
}

function simple_shell {
  export PS1="$1   "
}

fancy_shell

#################
# Bash Settings #
#################

# Bash history is appended not overwritten
shopt -s histappend
# Store more lines of history
unset HISTFILESIZE
HISTSIZE=1000000
# Don't store dupes, and ignore lines starting with space and other common commands
HISTCONTROL=ignoreboth
HISTIGNORE='bg:fg:history:h:ls:ls *:ll:ll *:'
# Timestamp
HISTTIMEFORMAT='%F %T '
# Store history immediately
# PROMPT_COMMAND="$PROMPT_COMMAND history -a"
# Turn of XON/XOFF Flow Control
stty -ixon

# RBenv and other apps in path
export PATH="$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$HOME/bin:$PATH"
eval "$(rbenv init -)"


# load Homebrew's shell completion
if which brew > /dev/null && [ -f "$(brew --prefix)/Library/Contributions/brew_bash_completion.sh" ]
then
  source "$(brew --prefix)/Library/Contributions/brew_bash_completion.sh"
fi

# improve performance of rails apps (at cost of memory usage)
export RUBY_GC_MALLOC_LIMIT=60000000
# export RUBY_FREE_MIN=200000

# autocomplete ssh servers
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Prefer US English
export LC_ALL="en_US.UTF-8"
# use UTF-8
export LANG="en_US"
