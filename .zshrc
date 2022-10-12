# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export APP_IMAGE=/home/chan-dev/.local/bin
export PATH=$PATH:$APP_IMAGE

export CUSTOM_SCRIPTS=/home/chan-dev/Coding/bash_functions
export PATH=$PATH:$CUSTOM_SCRIPTS

export ANDROID_SDK_ROOT=/home/chan-dev/Android_SDK
export ANDROID_HOME=$ANDROID_SDK_ROOT
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/tools

# Path to your oh-my-zsh installation.
export ZSH="/home/chan-dev/.oh-my-zsh"

export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border'

# if type rg &> /dev/null; then
    # export FZF_DEFAULT_COMMAND='rg --files'
    # export FZF_DEFAULT_OPTS='-m --height 50% --border'
# fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="awesomepanda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(ng git git-flow gitignore zsh-autosuggestions tmux docker docker-compose zsh-syntax-highlighting aws)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshrc='vim ~/.zshrc'
alias tmuxconf='vim ~/.tmux.conf'
alias ohmyzsh='vim ~/.oh-my-zsh'
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias cls='clear'
alias findports='sudo lsof -i -P -n | grep LISTEN'
# alias ytp='youtube-dl -o "%(playlist_index)s-%(title)s.%(ext)s"'
# docker prune images/container
alias dock_pi='docker rmi $(docker images -f "dangling=true" -q)'
alias dock_pc='docker container prune'

alias dud='du -d 1 -h'
alias duf='du -sh *'
# fd is being used by the fd app
# alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Global aliases
alias -g G='| grep'
alias -g T='| tail'
alias -g L='| less'
alias -g F='| fzf'
alias -g C='| xclip -in -selection clipboard'
# search stdout and open file in vim
alias -g OE='| fzf | xargs -r $EDITOR'

# Pass the file as the stdout on fzf
# When a user picks a file pipe it to open vim ($EDITOR)
openf() { fzf | xargs -I % -r $EDITOR % }
# Use this second form if you want to target a specific directory
# openfd() { ls -l $1 | awk '{ print $NF }' | fzf | xargs -I % -r $EDITOR % }
cleanlocal() { git fetch --prune | git --no-pager branch --merged | egrep -v "(^\*|master|dev|integration|release)" | xargs git branch -d }
# NOTE: be careful running this one
# Check if there's other branches you want to exclude before running this
# You can optionally remove `--merged` to cleanup remote branches that are not
# yet merged
cleanremote() { git fetch --prune && git --no-pager branch --remotes --merged | egrep -v "(^\*|master|dev|integration|release)" | sed 's|origin/||' | xargs git push origin --delete }
copyf() { cp -v $(fd . ~ -tf | fzf --delimiter=",") $(fd . ~ -td | fzf --delimiter=",") }
historycp() { history | sort --reverse --numeric-sort | fzf | awk '{ $1=""; print }' | tr -s ' ' | xclip -selection clipboard }
getpath() { echo $PATH | tr ":" "\n" }
openbook() { fd . ~/Documents/books -e pdf | fzf | xargs -I % xdg-open % }
viewrepo() { gh repo list | fzf | awk '{ print $1 }' | sed 's|chan-dev/||' | xargs gh repo view --web }
# If bash alias is NOT accepting arguments, it's better to use alias than bash
# function. Moreover, you can check the underlying command in alias by running
# `type aliasName`
alias switch_recent='git branch --sort=-committerdate | fzf --header="Checkout recent changed branch" --height="100%" --preview="git log {1} --color=always -p" | xargs git checkout'

# Git
# /dev/tty is a special file which is an alias to the terminal of the current
# process
alias current_branch='git branch --show-current | tee /dev/tty | xclip -selection clipboard'
upstream_current_branch() { git push -u origin $(git branch --show-current) }
git_switch() {  git switch $(git branch | fzf | awk '{ print $1 }') }
# Used this with `C` zsh suffix alias
# pick_branch C
pick_branch() { git branch | fzf | awk '{ print $1 }' }
# get modified file, useful when you want to checkout a particular file with
# long nested path
# Usage: git checkout `mod_file`
# git ol `mod_file` - get all commits that have introduced changes to this
# file
# -uno === --untracked-files=no - don't include untracked file
mod_file() {  git status -s -uno | fzf | awk '{ print $2 }' }

# Docker
pick_container() { docker ps -a --format '{{.Names}}' | fzf }
container_cleanup() { docker kill `docker ps -q` && docker container prune -f }
image_cleanup() { docker rmi $(docker images -f "dangling=true" -q) }
pick_network() { docker network ls --format="{{ .Name }}" | fzf }
ps_network() { docker network inspect --format="{{ json .Containers }}" $(pick_network) | python -m json.tool }
compose_down_cleanup() { docker-compose down --rmi 'all' -v }

# check gum cli package for enhancement
cleanAndReset() {
    # TODO: find a way to select directory to cd into in the dev-playground
    # cd doesn't work with xargs as explained in this stackoverflow answer
    # https://superuser.com/a/701389
    # ls | fzf | xargs cd
    git switch main --discard-changes
    git reset --hard
    git clean -fd
    code .
}

# Dev Playground
alias cdPlayground="cd ~/dev-playground"
alias playAngular="cd ~/dev-playground/angular-playground && cleanAndReset"
alias playExtension="cd ~/dev-playground/chrome-extension-playground && cleanAndReset"

alias cdWeava="cd ~/Coding/weava"

# Github
cloneExtension() {
    targetDirectory=$1
    git clone git@github.com:chan-dev/chrome-extension-playground.git $targetDirectory
    cd $targetDirectory
    # start with a clean slate
    rm -rf .git
    git init
    git add .
    git commit -m "Initial commit"
}

openPR() {
    currentBranch=`git branch --show-current`
    xdg-open "https://bitbucket.org/weava/$1/pull-requests/new?source=$currentBranch&t=1"
}

# Bitbucket
upstream_pr() {
    if [ -z $1 ]; then
        echo "Using the current directory as the repository name"
        defaultRepository=$(basename $(pwd))
        upstream_current_branch && openPR $defaultRepository
    else
        upstream_current_branch && openPR $1
    fi
}

# Utilities
# AWS
# check if required CORS response headers are present
# Source: https://www.mslinn.com/blog/2021/03/21/cors-aws.html
function testCors() {
    ORIGIN=$1
    S3OBJECT_PATH=$2
    METHOD=$3

    if [ -z "$ORIGIN" ]; then echo "No Origin Url is provided"; exit 1; fi
    if [ -z "$S3OBJECT_PATH" ]; then echo "No S3 Object path is provided is provided"; exit 1; fi
    if [ -z "$METHOD" ]; then METHOD=GET; fi

    echo "The URL passed is $S3OBJECT_PATH"


    curl -I -X OPTIONS \
        --no-progress-meter \
        -H "Origin: $ORIGIN"
        -H "Access-Control-Request-Method: $METHOD" \
        "$S3OBJECT_PATH" | \
        grep --color=never 'Access-Control'
}


# Key Bindings
bindkey '^ ' autosuggest-accept

export NVM_DIR=~/.nvm
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
export PATH=/home/chan-dev/.pyenv/versions/3.7.2/bin:$PATH


# Load Angular CLI autocompletion.
source <(ng completion script)
