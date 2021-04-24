# My dotfiles

## Steps:
1. Create a git bare repo
    ```
    git init --bare $HOME/dotfiles
    ```

2.  Create an alias for git to always execute git commands relative to `$HOME`
    Put commands in `.bashrc` or `.zshrc`
    ```
    alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
    ```

3. Set git config so we won't list other `$HOME` files
    ```
    dot config --local status.showUntrackedFiles no
    ```


Reference:
https://www.youtube.com/watch?v=tBoLDpTWVOM
