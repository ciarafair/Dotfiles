#! /usr/bin/env bash

# Get the operating system name
os_name=$(uname -s)

# Check if the operating system is macOS
if [ "$os_name" = "Darwin" ]; then

	# Brew-wrap
	if [ -f $(brew --prefix)/etc/brew-wrap ]; then
		source $(brew --prefix)/etc/brew-wrap
	fi

	export HOMEBREW_BREWFILE=~/.config/scripts/Brewfile
fi
