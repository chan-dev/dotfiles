# My dotfiles

## Steps to create:
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

## Steps on how to use (i.e, on other PC or after fresh install):
1. Follow the exact same steps above
2. Add remote repo as origin
   ```
   dot remote add origin https://github.com/chan-dev/dotfiles.git
   ```
    If there are any conflicts, make sure to backup the files first -- for example, it conflicts with current `.bashrc`.
    Then backup by `cp ~/.bashrc ~/.bashrc-old`
    
Reference:
https://www.youtube.com/watch?v=tBoLDpTWVOM
