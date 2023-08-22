#! /usr/bin/env bash

os_name=$(uname -s)
if [ "$os_name" = "Darwin" ]; then
	if [ -f $(brew --prefix)/etc/brew-wrap ]; then
		source $(brew --prefix)/etc/brew-wrap
	fi
	export HOMEBREW_BREWFILE=~/.config/scripts/Brewfile
fi
