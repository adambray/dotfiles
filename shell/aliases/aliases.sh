# ================
# General Aliases
# ================

alias ls='ls -F'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias h='history'
alias b='cd ..'

alias o='ssh oppenheimer'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias dl='cd ~/Downloads'
alias doc='cd ~/Documents'
alias dsk='cd ~/Desktop'

alias diff='opendiff'

alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem update'

alias dotfiles='cd ~/.dotfiles && atom .'

alias fuck='$(thefuck $(fc -ln -1))'

# ================
# Git Aliases
# ================

# Many more come from jasoncodes dotfiles
alias gb='git branch'
alias gdc='git diff --cached'

# Undo a git push
alias undopush="git push -f origin HEAD^:master"
# undo a commit
alias uncommit="git reset --soft HEAD^"


# ================
# Application Aliases
# ================

alias mou='open -a "Mou"'
alias hipchat='open -a "HipChat"'
alias chrome='open -a "Google Chrome"'


# =================
# Rails
# =================
# Migrate Dev and Test databases and annotate models
alias migrate='rake db:migrate; rake db:migrate RAILS_ENV=test; annotate'


# =================
# Other
# =================

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Hide/show hidden files in Finder
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias showfiles="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"

# List any open internet sockets on port 3000. Useful if a rogue server is running
# http://www.akadia.com/services/lsof_intro.html
alias rogue='lsof -i TCP:3000'

# Start an HTTP server from a directory, optionally specifying the port
function server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# add a poor facsimile for Linux's `free` if we're on Mac OS
if ! type free > /dev/null 2>&1 && [[ "$(uname -s)" == 'Darwin' ]]
then
  alias free="top -s 0 -l 1 -pid 0 -stats pid | grep '^PhysMem: ' | cut -d : -f 2- | tr ',' '\n'"
fi


# open man pages in Preview.app
if [ -d "/Applications/Preview.app" ]
then
  pman () {
    man -t "$@" |
    ( which ps2pdf > /dev/null && ps2pdf - - || cat) |
    open -f -a /Applications/Preview.app
  }
fi
