# ~/.bashrc

# Only run in interactive shells
if [[ $- != *i* ]] ; then
  return
fi

# ---- Colors for prompt ----
CYAN="\[\e[01;36m\]"
GREEN="\[\e[01;32m\]"
RED="\[\e[01;31m\]"
WHITE="\[\e[0m\]"

# ---- Helpers ----
get_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ ( \1 )/'
}

# Prompt (exit code, user@host, cwd, git branch)
PS1="\$?\[ ${GREEN}\u${WHITE}@${GREEN}\h${WHITE} \]${CYAN}\w${RED}\$(get_git_branch)${WHITE}\n\$> "

# ---- Editor ----
export EDITOR="nvim"
export VISUAL="$EDITOR"

# ---- History ----
export HISTCONTROL=ignoreboth
shopt -s histappend

# Disable completion when the input buffer is empty.
shopt -s no_empty_cmd_completion

# ---- Environment ----
if [[ -z "${DISPLAY}" ]]; then
  export DISPLAY=:0
fi

export BASH_SILENCE_DEPRECATION_WARNING=1

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/scripts:$PATH"


# ---- Aliases ----
if [[ -f ~/.bash_aliases ]]; then
  . ~/.bash_aliases
fi

# ---- Completions ----
if [[ ${BASH_VERSINFO[0]} -ge 4 ]] && [[ -r /usr/local/etc/bash_completion ]]; then
  . /usr/local/etc/bash_completion
fi

if [[ -r ~/.fzf.bash ]]; then
  source ~/.fzf.bash
fi

# ---- Tools ----
export BAT_THEME="Solarized (dark)"
export PYTHONBREAKPOINT="pudb.set_trace"

# Register previous command for `pet`
adopt() {
  PREV=$(history | tail -n2 | head -n1 | sed 's/[0-9]* //')
  sh -c "pet new $(printf %q "$PREV")"
}

# Search pet snippets and output to shell
pet-select() {
  BUFFER=$(pet search --query "$READLINE_LINE")
  READLINE_LINE=$BUFFER
  READLINE_POINT=${#BUFFER}
}
bind -x '"\C-x\C-r": pet-select'

# ---- pyenv ----
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
