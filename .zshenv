export EDITOR=vim

# Functions
fzf_find_edit() {
    local file=$(
      fzf --no-multi --preview 'bat --color=always --line-range :500 {}'
      )
    if [[ -n $file ]]; then
        vim $file
    fi
}

fzf_grep_edit(){
    if [[ $# == 0 ]]; then
        echo 'Error: search term was not provided.'
        return
    fi
    local match=$(
      rg --color=never --line-number "$1" |
        fzf --no-multi --delimiter : \
            --preview "bat --color=always --line-range {2}: {1}"
      )
    local file=$(echo "$match" | cut -d':' -f1)
    if [[ -n $file ]]; then
        $EDITOR $file +$(echo "$match" | cut -d':' -f2)
    fi
}

# Aliases
alias fge='fzf_grep_edit'
alias ffe='fzf_find_edit'
