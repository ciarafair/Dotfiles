#!/bin/bash

echo 'export XDG_CONFIG_HOME="$HOME/.config"'
echo 'export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"'
echo 'export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"'
echo 'export ZDOTDIR="$XDG_CONFIG_HOME/zsh"'
echo ''
echo 'export HISTFILE="$ZDOTDIR/.zhistory" # History filepath'
echo 'export HISTSIZE=10000                # Maximum events for internal history'
echo 'export SAVEHIST=10000                # Maximum events in history file'
