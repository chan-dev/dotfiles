# My dotfiles

Put this in `.bashrc` or `.zshrc`

## Create an alias for git to always execute git commands relative to `$HOME`
```
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
```

## Set git config so we won't list other `$HOME files`
```
dot config --local status.showUntrackedFiles no
```
