# -----------------
# For git the prompt
# -----------------
# Long git to show + ? !
is_git_repo() {
    $(git rev-parse --is-inside-work-tree &> /dev/null)
}
is_git_dir() {
    $(git rev-parse --is-inside-git-dir 2> /dev/null)
}
get_git_branch() {
    local branch_name
    # Get the short symbolic ref
    branch_name=$(git symbolic-ref --quiet --short HEAD 2> /dev/null) ||
    # If HEAD isn't a symbolic ref, get the short SHA
    branch_name=$(git rev-parse --short HEAD 2> /dev/null) ||
    # Otherwise, just give up
    branch_name="(unknown)"
    printf $branch_name
}
# Git status information
prompt_git() {
    local git_info git_state uc us ut st
    if ! is_git_repo || is_git_dir; then
        return 1
    fi
    git_info=$(get_git_branch)
    # Check for uncommitted changes in the index
    if ! $(git diff --quiet --ignore-submodules --cached); then
        uc="+"
    fi
    # Check for unstaged changes
    if ! $(git diff-files --quiet --ignore-submodules --); then
        us="!"
    fi
    # Check for untracked files
    if [ -n "$(git ls-files --others --exclude-standard)" ]; then
        ut="${RED}?"
    fi
    # Check for stashed files
    if $(git rev-parse --verify refs/stash &>/dev/null); then
        st="$"
    fi
    git_state=$uc$us$ut$st
    # Combine the branch name and state information
    if [[ $git_state ]]; then
        git_info="$git_info${RESET}[$git_state${RESET}]"
    fi
    printf "${WHITE} on ${style_branch}${git_info}"
}

# ---------------------
# style the prompt
# ---------------------
style_user="\[${RESET}${GREEN}${BOLD}\]"
style_path="\[${RESET}${PURPLE}\]"
style_chars="\[${RESET}${WHITE}\]"
style_branch="${RED}"
# ---------------------
# Build the prompt
# ---------------------
# Example with committed changes: username ~/documents/GA/wdi on master[+]
FANCY_PROMPT="${style_user}\u@\h: "                    # Username
FANCY_PROMPT+="${style_path}\w"                  # Working directory
FANCY_PROMPT+="\$(prompt_git)"                    # Git details
FANCY_PROMPT+="\n"                                # Newline
FANCY_PROMPT+="${style_chars}\$ \[${RESET}\] "     # $ (and reset color)

function fancy_shell {
  # Prompt shows current path, git branch and timestamp (useful to know when you run what command)
  # export PS1='\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(prompt_git)${RESET}   ҈ \n$ '
  export PS1="$FANCY_PROMPT"
}

function simple_shell {
  export PS1="$1   "
}

fancy_shell
