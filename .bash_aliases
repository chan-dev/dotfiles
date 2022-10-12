alias nvm-lts="nvm ls-remote | grep -i 'latest'"
alias lh='ls --human-readable --size -1 -S --classify'
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias custom_alias='less ~/.bash_aliases'

alias vpns='sudo protonvpn c --fastest'
alias vpnd='sudo protonvpn d'
alias netchk='nmcli connection show --active'

# Git
# Note the `\*` symbol in the pattern is for the current branch
# Current branches are preceded with *
alias cleanbranches='git branch --merged | egrep -v "(^\*|master|dev|integration)" | xargs git branch -d'

# npm scripts
alias nps='npm run start'
alias npb='npm run build'
# always use latest angular
alias ngn='npx -p @angular/cli ng'

# work related aliases
# web
alias build-test='npm run build:all-testing'
alias build-dev='npm run build:all'
# chrome extension
alias build-fast='npm run build-project:no-pdf -- --include-web=false'

# NX
alias nxNew='npx create-nx-workspace@latest'
