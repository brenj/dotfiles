# Only run in interactive shells
[[ $- != *i* ]] && return

# ---- Colors for prompt ----
CYAN="\[\e[01;36m\]"
GREEN="\[\e[01;32m\]"
WHITE="\[\e[0m\]"

# Prompt (exit code, user@host, cwd)
PS1="\$? [ ${GREEN}\u${WHITE}@${GREEN}\h${WHITE} ] ${CYAN}\w${WHITE}\n\$> "

# ---- Editor ----
export EDITOR="nvim"
export VISUAL="$EDITOR"

# ---- History ----
export HISTFILE="$HOME/.bash_history"
export HISTSIZE=100000
export HISTFILESIZE=200000
export HISTCONTROL="ignoredups:erasedups:ignorespace"
export HISTIGNORE="ls:ll:la:pwd:cd:cd -:history:exit:clear:gs:fg:gd"
shopt -s histappend
shopt -s no_empty_cmd_completion

# Keep history synced across sessions
PROMPT_COMMAND="history -a${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

# ---- Environment ----
export BASH_SILENCE_DEPRECATION_WARNING=1
export PYENV_ROOT="$HOME/.pyenv"

BREW_PREFIX="$(brew --prefix 2>/dev/null)"
export PATH="$PYENV_ROOT/bin:$BREW_PREFIX/sbin:$BREW_PREFIX/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/scripts:$PATH"

# ---- Aliases ----
if [[ -f ~/.bash_aliases ]]; then
  . ~/.bash_aliases
fi

# ---- Bash completion ----
if [[ -r "$BREW_PREFIX/etc/profile.d/bash_completion.sh" ]]; then
  . "$BREW_PREFIX/etc/profile.d/bash_completion.sh"
fi

# ---- fzf ----
if command -v fzf >/dev/null 2>&1; then
  eval "$(fzf --bash)"
fi

# ---- Tools ----
export BAT_THEME="Solarized (dark)"
export PYTHONBREAKPOINT="pudb.set_trace"

# Register previous command for `pet`
adopt() {
  local PREV
  PREV=$(history | tail -n2 | head -n1 | sed 's/^[ ]*[0-9]\+[ ]*//')
  sh -c "pet new $(printf %q "$PREV")"
}

# Search pet snippets and output to shell
pet-select() {
  local BUFFER
  BUFFER=$(pet search --query "$READLINE_LINE")
  READLINE_LINE=$BUFFER
  READLINE_POINT=${#BUFFER}
}
bind -x '"\C-x\C-r": pet-select'

# ---- pyenv ----
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
