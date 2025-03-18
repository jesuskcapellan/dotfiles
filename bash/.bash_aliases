alias bashit="nvim ~/.bashrc"
alias tmuxit="nvim ~/.tmux.conf"
alias conkit="nvim ~/.config/nvim"
alias nameit="nvim ~/.bash_aliases"
alias shit="nvim ~/.local/bin/tmux-sessionizer"
alias rebash="source ~/.bashrc"
alias pype="export PYTHONPATH=\"$PYTHONPATH:$PWD\""

# Git
alias gtp="git pull"
alias gtc="git checkout"
alias gtrs="git reset --soft "
alias gtrm="git rm -f"
alias gtfix="git add . && git commit --amend --no-edit"
gta(){
    git add .
    git commit -m "$@"
}
gtrw(){
    git reset --soft HEAD~"$1"
}

alias gtff="git add . && git commit -c ORIG_HEAD"
gibby() {
    branch=$(git rev-parse --abbrev-ref HEAD)
    target=${1:-main}
    touch TEMP_GIBBY && gta "TEMP GIBBY COMMIT"
    gtc "$target"
    gtp
    gtc "$branch"
    git rebase "$target"
}
guppy() {
    commit=$(git log -1 --pretty=%B)
    if echo "$commit" | grep -q "TEMP\sGIBBY\sCOMMIT"; then
        echo "✔️ Guppy succeeded"
        echo "Cleaning up..."
        gtrs HEAD~
        gtrm TEMP_GIBBY
    else
        echo "❌ Guppy failed"
        echo "Latest commit not a Gibby commit"
    fi
}


