#!/usr/bin/env aptfile

# check user os
if [ "$(uname)" != "Linux" ]; then
	echo "This script is for Linux systems only."
	exit 1
fi
# trigger an apt-get update
sudo apt-get update && apt-get upgrade

# install some packages
sudo apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg2 \
	lsb-release \
	build-essential \
	git-core \
	software-properties-common \
	curl \
	wget \
	vim \
	zsh \
	tmux \
	htop \
	autoconf \
	automake \
	lolcat \
	pipes-sh \
	fortune \
	cowsay \
	figlet \
	--no-install-recommends
