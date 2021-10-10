alias nvm-lts="nvm ls-remote | grep -i 'latest'"
alias lt='ls --human-readable --size -1 -S --classify'
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

alias vpns='sudo protonvpn c --fastest'
alias vpnd='sudo protonvpn d'
alias netchk='nmcli connection show --active'

# npm scripts
alias nps='npm run start'
alias npb='npm run build'
# always use latest angular
alias ngn='npx -p @angular/cli ng'

# work related aliases
alias build-test='npm run build:all-testing'
alias build-dev='npm run build:all'
