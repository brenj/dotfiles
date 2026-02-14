# Declare bash aliases
# vi: set filetype=sh :

# 1 character
alias h='history'
alias l='ls -lhA'
alias v='code -r'

# 2 character
alias ..='cd ..'
alias cl='clear'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gf='git fetch'
alias go='git checkout'
alias gp='git pull origin'
alias gs='git status'
alias gu='git reset --soft HEAD~1'
alias gz='git branch |fzf |xargs git checkout'
alias ls='ls -lGHh'
alias nv='nvim'
alias pb='pbcopy'
alias vf="fzf -q '!.pyc ' |xargs -o nvim"
alias vs="fzf -q '!.pyc src/ ' |xargs -o nvim"

# 3 character
alias cat='bat -p --paging=never'
alias rip='rg --column --line-number --no-heading --color=always --smart-case '
alias venv='source .venv/bin/activate'

# 4 character
alias fzfp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

# 5 character
alias mkdir='mkdir -pv'
