# ~/.bash_profile

# Load interactive shell configuration
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Load iTerm2 shell integration
if [ -f "${HOME}/.iterm2_shell_integration.bash" ]; then
  source "${HOME}/.iterm2_shell_integration.bash"
fi
