#███████ ███████ ██   ██
#   ███  ██      ██   ██
#  ███   ███████ ███████
# ███         ██ ██   ██
#███████ ███████ ██   ██

#   ___                       _
#  / __|___ _ _  ___ _ _ __ _| |
# | (_ / -_) ' \/ -_) '_/ _` | |
#  \___\___|_||_\___|_| \__,_|_|

# Imports
source $HOME/.config/.alias
source $HOME/antigen.zsh

# Options
setopt autocd

# Export paths
export PATH=/Users/ciara/.local/bin:$PATH
export PATH="${PATH}:REPLACE"

# Homebrew
if [ -n "$SSH_CLIENT" ]; then
  echo "In ssh session. Not updating brew."
else
  if [ -f $(brew --prefix)/etc/brew-wrap ]; then
    source $(brew --prefix)/etc/brew-wrap
  fi
  export HOMEBREW_BREWFILE=~/.config/Brewfile
fi

#   /_\  _ _| |_(_)__ _ ___ _ _
#  / _ \| ' \  _| / _` / -_) ' \
# /_/ \_\_||_\__|_\__, \___|_||_|
#                 |___/

if [ -n "$SSH_CLIENT" ]; then
  echo "In ssh session. Using SSH Antigen file."
  antigen init $HOME/.config/.antigenrc.ssh
else
  antigen init $HOME/.config/.antigenrc
fi

#  _____
# |_   _| __ _  ___ __
#   | || '  \ || \ \ /
#   |_||_|_|_\_,_/_\_\

if [ -n "$SSH_CLIENT" ]; then
  echo "In ssh session. Not connecting to TMUX."
else
  if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new
  fi
fi
