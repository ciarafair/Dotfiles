#! /usr/bin/env bash

os_name=$(uname -s)
if [ "$os_name" = "Darwin" ]; then
	echo "Updating Homebrew..."
	brew update && brew upgrade
	echo "Done"
fi

if [ "$os_name" = "Linux" ]; then
	if [ -f /etc/os-release ]; then
		source /etc/os-release
	if [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then
		echo "Updating APT packages..."
		sudo apt update && sudo apt upgrade -y
		echo "Done"
	elif [ "$ID" = "centos" ]; then
		echo "Updating YUM packages..."
		sudo yum update -y
		echo "Done"
	elif [ "$ID" = "fedora" ]; then
		echo "Updating DNF packages..."
		sudo dnf update -y
		echo "Done"
	else
		echo "Unsupported Linux distribution: $ID"
	fi
	else
		echo "Could not determine the Linux distribution."
	fi
fi
