#!/bin/sh

clear
while true; do
	read -p "Are you using a host machine? (y/n): " answer
	if [ "$answer" = "y" ]; then
		$HOME/.config/scripts/zshenv.sh >$HOME/.zshenv
		echo "Sourced files to the config directory."
		break
	elif [ "$answer" = "n" ]; then
		$HOME/.config/scripts/zshenv.sh >$HOME/.zshenv
		echo "Sourced files to the config directory."
		break
	else
		echo "Invalid input. Please enter 'y' or 'n'."
	fi
done
