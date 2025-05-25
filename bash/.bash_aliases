# Bash Aliases
alias bashit="nvim ~/.bashrc"
alias tmuxit="nvim ~/.config/tmux/tmux.conf"
alias conkit="nvim ~/.config/nvim"
alias nameit="nvim ~/.bash_aliases"
alias shit="nvim ~/.local/bin/tmux-sessionizer"
alias rebash="source ~/.bashrc"
alias pype="export PYTHONPATH=\"$PYTHONPATH:$PWD\""

# Git Aliases
alias pull="git pull"
alias goto="git checkout"
alias del="git rm -f"
alias fix="git add . && git commit --amend --no-edit"
alias ff="git add . && git commit -c ORIG_HEAD"
alias sweep="git clean -fd"
alias check="git status"

# Git Functions
add(){
    git add .
    git commit -m "$1"
}
back(){
    git reset --soft HEAD~"$1"
}
gibby() {
    branch=$(git rev-parse --abbrev-ref HEAD)
    target=${1:-main}
    touch TEMP_GIBBY
    add "TEMP GIBBY"
    goto "$target"
    pull
    goto "$branch"
    git rebase "$target"
}
guppy() {
    commit=$(git log -1 --pretty=%B)
    if echo "$commit" | grep -q "TEMP\sGIBBY\sCOMMIT"; then
        echo "✔️ Guppy succeeded"
        echo "Cleaning up..."
        back
        sweep
    else
        echo "❌ Guppy failed"
        echo "Latest commit not a Gibby commit"
    fi
}

# Git Completions
source /usr/share/bash-completion/completions/git
__git_complete goto _git_checkout


