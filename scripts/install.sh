#!/bin/sh

clear

while true; do

	read -p "Are you using a host machine? (y/n): " answer

	if [ "$answer" = "y" ]; then
		echo "source $HOME/.config/.zshrc" >$HOME/.zshrc
		echo "source $HOME/.config/.zprofile" >$HOME/.zprofile
		echo "source $HOME/.config/.bashrc" >$HOME/.bashrc
		echo "source $HOME/.config/tmux/tmux.conf" >$HOME/.tmux.conf
		echo "Sourced files to the config directory."

		break

	elif [ "$answer" = "n" ]; then
		echo "source $HOME/.config/.zshrc" >$HOME/.zshrc
		echo "source $HOME/.config/.bashrc" >$HOME/.bashrc
		echo "Sourced files to the config directory."
		break

	else
		echo "Invalid input. Please enter 'y' or 'n'."
	fi

done
