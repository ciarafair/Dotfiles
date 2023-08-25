#!/bin/sh

clear
while true; do
	read -p "Do you want to hush login? (y/n): " answer
	if [ "$answer" = "y" ]; then
		$HOME/.config/scripts/update.sh
		$HOME/.config/scripts/backup.sh
		$HOME/.config/scripts/symlink.sh
		$HOME/.config/scripts/hushlogin.sh
		echo "Installing antigen..."
		curl -L git.io/antigen > antigen.zsh
		break
	elif [ "$answer" = "n" ]; then
		$HOME/.config/scripts/update.sh
		$HOME/.config/scripts/backup.sh
		$HOME/.config/scripts/symlink.sh
		echo "Installing antigen..."
		curl -L git.io/antigen > antigen.zsh
		break
	else
		echo "Invalid input. Please enter 'y' or 'n'."
	fi
done
