#!/bin/sh

clear

while true; do

	read -p "Are you using a host machine? (y/n): " answer

	if [ "$answer" = "y" ]; then
		$HOME/.config/scripts/zshenv.sh >$HOME/.zshenv
		echo "source $HOME/.config/.bashrc" >$HOME/.bashrc
		echo "source $HOME/.config/tmux/tmux.conf" >$HOME/.tmux.conf
		echo "source $HOME/.config/.yarnrc" >$HOME/.yarnrc
		echo "source $HOME/.config/vim/.vimrc" >$HOME/.vimrc
		echo "Sourced files to the config directory."

		break

	elif [ "$answer" = "n" ]; then
		$HOME/.config/scripts/zshenv.sh >$HOME/.zshenv
		echo "source $HOME/.config/.bashrc" >$HOME/.bashrc
		echo "Sourced files to the config directory."
		break

	else
		echo "Invalid input. Please enter 'y' or 'n'."
	fi

done
