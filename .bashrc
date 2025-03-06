# ~/.bashrc

if [[ $- != *i* ]] ; then
  # Shell is non-interactive. Exit.
  return
fi

CYAN="\[\e[01;36m\]"
GREEN="\[\e[01;32m\]"
RED="\[\e[01;31m\]"
WHITE="\[\e[0m\]"

PS1="\$?\[ ${GREEN}\u${WHITE}@${GREEN}\h${WHITE} \]${CYAN}\w${RED}\$(get_git_branch)${WHITE}\n\$> "

EDITOR="nvim"
VISUAL="$EDITOR"
HISTCONTROL=ignoreboth

get_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ ( \1 )/'
}

if [ -z "${DISPLAY}" ]; then
  export DISPLAY=:0
fi

export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/tools

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Disable completion when the input buffer is empty.
shopt -s no_empty_cmd_completion

# Enable history appending instead of overwriting when exiting.
shopt -s histappend

# Load SSH agent and keys
# eval `keychain --eval --agents ssh id_rsa_tq`

[ -f /usr/local/etc/bash_completion  ] && . /usr/local/etc/bash_completion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export BAT_THEME="Solarized (dark)"
export PYTHONBREAKPOINT="pudb.set_trace"

# Register previous command for `pet`
function adopt() {
  PREV=$(echo `history | tail -n2 | head -n1` | sed 's/[0-9]* //')
  sh -c "pet new `printf %q "$PREV"`"
}

# Search pet snippets and output to shell
function pet-select() {
  BUFFER=$(pet search --query "$READLINE_LINE")
  READLINE_LINE=$BUFFER
  READLINE_POINT=${#BUFFER}
}
bind -x '"\C-x\C-r": pet-select'

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
