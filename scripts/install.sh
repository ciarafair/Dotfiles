#!/bin/sh

clear
while true; do
	read -p "Are you using a host machine? (y/n): " answer
	if [ "$answer" = "y" ]; then
		echo "Setting ZSH environment with .zshenv"
		$HOME/.config/scripts/zshenv.sh >$HOME/.zshenv
		$HOME/.config/scripts/update.sh
		break
	elif [ "$answer" = "n" ]; then
		echo "Setting ZSH environment with .zshenv"
		$HOME/.config/scripts/zshenv.sh >$HOME/.zshenv
		$HOME/.config/scripts/update.sh
		break
	else
		echo "Invalid input. Please enter 'y' or 'n'."
	fi
done
