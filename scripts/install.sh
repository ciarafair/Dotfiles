#!/bin/sh

clear
while true; do
	read -p "Do you want to hush login? (y/n): " answer
	if [ "$answer" = "y" ]; then
		$HOME/.dotfiles/scripts/update.sh
		$HOME/.dotfiles/scripts/symlink.sh
		$HOME/.dotfiles/scripts/hushlogin.sh
		if ! [ -f $HOME/antigen.zsh ]
		then
			echo "Installing antigen..."
			curl -L git.io/antigen > $HOME/antigen.zsh
		fi
		break
	elif [ "$answer" = "n" ]; then
		$HOME/.dotfiles/scripts/update.sh
		$HOME/.dotfiles/scripts/symlink.sh
		if ! [ -f $HOME/antigen.zsh ]
		then
			echo "Installing antigen..."
			curl -L git.io/antigen > $HOME/antigen.zsh
		fi
		break
	else
		echo "Invalid input. Please enter 'y' or 'n'."
	fi
done