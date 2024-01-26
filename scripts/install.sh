#!/bin/sh
source symlink.sh

clear

# Install Gum
if ! [ -d /etc/apt/keyrings ]; then
	sudo mkdir -p /etc/apt/keyrings
	curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
	echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
	sudo apt update && sudo apt install gum
fi

#while true; do
#	read -p "Do you want to hush login? (y/n): " answer
#	if [ "$answer" = "y" ]; then
#		$HOME/.dotfiles/scripts/update.sh
#		$HOME/.dotfiles/scripts/symlink.sh
#		$HOME/.dotfiles/scripts/hushlogin.sh
#		if ! [ -f $HOME/antigen.zsh ]
#		then
#			echo "Installing antigen..."
#			curl -L git.io/antigen > $HOME/antigen.zsh
#		fi
#		break
#	elif [ "$answer" = "n" ]; then
#		$HOME/.dotfiles/scripts/update.sh
#		$HOME/.dotfiles/scripts/symlink.sh
#		if ! [ -f $HOME/antigen.zsh ]
#		then
#			echo "Installing antigen..."
#			curl -L git.io/antigen > $HOME/antigen.zsh
#		fi
#		break
#	else
#		echo "Invalid input. Please enter 'y' or 'n'."
#	fi
#done

hushlogin() {
	gum spin  --spinner dot --title "Creating hush login file..."  sleep 2
	if [ -f $HOME/.hushlogin ];	then
		gum log --time rfc822  --structured --level error  "Hushlogin already exists."
	else
		touch $HOME/.hushlogin
		gum log --time rfc822  --structured --level debug  "Hushlogin created."
	fi
	return
}


symlink() {
    gum spin --spinner dot --title "Symlinking and backing up existing config files..."  sleep 2
    if ! [ -d $HOME/.backups ]; then
        gum log --time rfc822  --structured --level error "Backup directory does not exist"
        mkdir $HOME/.backups
    fi

    if [ -f $HOME/.gitconfig ]; then
        gum log --time rfc822  --structured --level debug "File .gitconfig exists. Backing up..."
        if [ -f $HOME/.backups/.gitconfig.bak ]; then
            gum log --time rfc822  --structured --level error ".gitconfig backup file exists."
            rm -rf $HOME/.backups/.gitconfig.bak
        fi
        mv $HOME/.gitconfig $HOME/.backups/.gitconfig.bak
    fi
    ln -sf $HOME/.dotfiles/git/.gitconfig $HOME/.gitconfig

    if [ -f $HOME/.zshenv ]; then
        gum log --time rfc822  --structured --level debug "File .zshenv exists. Backing up..."
        if [ -f $HOME/.backups/.zshenv.bak ]; then
            gum log --time rfc822  --structured --level error ".zshenv backup file exists"
            rm -rf $HOME/.backups/.zshenv.bak
        fi
        mv $HOME/.zshenv $HOME/.backups/.zshenv.bak
    fi
    ln -sf $HOME/.dotfiles/zsh/.zshenv $HOME/.zshenv

    if [ -f $HOME/.zshrc ]; then
        gum log --time rfc822  --structured --level debug "File .zshrc file exists. Backing up..."
        if [ -f $HOME/.backups/.zshrc.bak ]; then
            gum log --time rfc822  --structured --level error ".zshrc backup file exists."
            rm -rf $HOME/.backups/.zshrc.bak
        fi
        mv $HOME/.zshrc $HOME/.backups/.zshrc.bak
    fi
    ln -sf $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc

    if ! [ -d $HOME/.config/zsh ]; then 
        gum log --time rfc822  --structured --level error "ZSH directory does not exist"
        mkdir $HOME/.config/zsh
    fi

    if [ -f $HOME/.config/zsh/.zshrc ]; then 
        gum log --time rfc822  --structured --level debug "zsh/.zshrc exist. Backing up."
        if [ -f $HOME/.backups/.zshrc.bak ]; then
            gum log --time rfc822  --structured --level error ".zshrc backup file exists."
            rm -rf $HOME/.backups/.zshrc.bak
        fi
    fi
    ln -sf $HOME/.dotfiles/zsh/.zshrc $HOME/.config/zsh/.zshrc

    if [ -f $HOME/.bashrc ]; then
        gum log --time rfc822  --structured --level debug ".bashrc file exists. Backing up..."
        if [ -f $HOME/.backups/.bashrc.bak ]; then
            gum log --time rfc822  --structured --level error ".bashrc backup file exists."
            rm -rf $HOME/.backups/.bashrc.bak
        fi
        mv $HOME/.bashrc $HOME/.backups/.bashrc.bak
    fi
    ln -sf $HOME/.dotfiles/bash/.bashrc $HOME/.bashrc

    if [ -d $HOME/.config/tmux ]; then
        gum log --time rfc822  --structured --level debug "Tmux config directory exists."
        if [ -f $HOME/.config/tmux/tmux.conf ]; then
            gum log --time rfc822  --structured --level debug "Tmux config file exists. Backing up..."

            if ! [ -d $HOME/.backups/tmux ]; then
                gum log --time rfc822  --structured --level error "Tmux backup directory does not exist."
                mkdir $HOME/.backups/tmux
            fi
            
            if [ -f $HOME/.backups/tmux/tmux.conf.bak ]; then
               gum log --time rfc822  --structured --level error "Tmux backup file exists."
               rm -rf $HOME/.backups/tmux/tmux.conf.bak
            fi        
            
            mv $HOME/.config/tmux/tmux.conf $HOME/.backups/tmux/tmux.conf.bak
        fi
    fi
    ln -sf $HOME/.dotfiles/tmux $HOME/.config/tmux

    if [ -d $HOME/.config/polybar ]; then 
        gum log --time rfc822  --structured --level debug "Polybar config directory exists."
        if [ -f $HOME/.config/polybar/config.ini ]; then
            gum log --time rfc822  --structured --level debug "Polybar config file exists. Backing up..."

            if ! [ -d $HOME/.backups/polybar ]; then
                gum log --time rfc822  --structured --level error "Polybar backup directory does not exist."
                mkdir $HOME/.backups/polybar
            fi

            if [ -f $HOME/.backups/polybar/config.ini.bak ]; then
                gum log --time rfc822  --structured --level error "Polybar backup file exists."
                rm -rf $HOME/.backups/polybar/config.ini.bak
            fi

            mv $HOME/.config/polybar/config.ini $HOME/.backups/polybar/config.ini.bak
        fi
    else
        gum log --time rfc822  --structured --level error "Polybar directory does not exist."
        mkdir $HOME/.config/polybar
    fi
    ln -sf $HOME/.dotfiles/polybar/config.ini $HOME/.config/polybar/config.ini

    if [ -d $HOME/.config/neofetch ]; then 
        gum log --time rfc822  --structured --level debug "Neofetch config directory exists."
        if [ -f $HOME/.config/neofetch/config.conf ]; then
            gum log --time rfc822  --structured --level debug "Neofetch config file exists. Backing up..."
            if ! [ -d $HOME/.backups/neofetch ]; then
                gum log --time rfc822  --structured --level error "Neofetch backup directory does not exist."
                mkdir $HOME/.backups/neofetch
            fi

            if [ -f $HOME/.backups/neofetch/config.conf.bak ]; then
                gum log --time rfc822  --structured --level error "Neofetch backup file exists."
                rm -rf $HOME/.backups/neofetch/config.conf.bak
            fi

            mv $HOME/.config/neofetch/config.conf $HOME/.backups/neofetch/config.conf.bak
        fi
    else
        gum log --time rfc822  --structured --level error "Neofetch directory does not exist."
        mkdir $HOME/.config/neofetch
    fi
    ln -sf $HOME/.dotfiles/neofetch/config.conf $HOME/.config/zsh/neofetch/config.conf

    if [ -d $HOME/.config/alacritty ]; then
        gum log --time rfc822  --structured --level debug "Alacritty config directory exists"
        if [ -f $HOME/.config/alacritty/alacritty.yml ]; then
            gum log --time rfc822  --structured --level debug "Alacritty config file exists. Backing up..."
            if ! [ -d $HOME/.backups/alacritty ]; then
                gum log --time rfc822  --structured --level error "Alacritty backup directory does not exist"
                mkdir $HOME/.backups/alacritty
            fi

            if [ -f $HOME/.backups/alacritty/alacritty.yml.bak ]; then
                gum log --time rfc822  --structured --level error "Alacritty backup file exists"
                rm -rf $HOME/.backups/alacritty/alacritty.yml.bak
            fi

            mv $HOME/.config/alacritty/alacritty.yml $HOME/.backups/alacritty/alacritty.yml.bak
        else
            gum log --time rfc822  --structured --level debug "Alacritty file does not exist"
        fi
    else
        gum log --time rfc822  --structured --level debug "Alacritty directory does not exist"
        mkdir $HOME/.config/alacritty
    fi
    ln -sf $HOME/.dotfiles/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml

    if [ -d $HOME/.config/i3 ]; then
        gum log --time rfc822  --structured --level debug "i3 config directory exists"
        if [ -f $HOME/.config/i3/config ]; then
            gum log --time rfc822  --structured --level debug "i3 config file exists. Backing up..."
            if ! [ -d $HOME/.backups/i3 ]; then
                gum log --time rfc822  --structured --level error "i3 backup directory does not exist"
                mkdir $HOME/.backups/i3
            fi

            if [ -f $HOME/.backups/i3/config.bak ]; then
                gum log --time rfc822  --structured --level error "i3 backup file exists"
                rm -rf $HOME/.backups/i3/config.bak
            fi

            mv $HOME/.config/i3/config $HOME/.backups/i3/config.bak
        fi
    else
        gum log --time rfc822  --structured --level error "i3 directory does not exist"
        mkdir $HOME/.config/i3
    fi
    ln -sf $HOME/.dotfiles/i3/config $HOME/.config/i3/config
    return
}


update_os() {
	gum spin --spinner dot --title "Finding OS..."  sleep 2
	os_name=$(uname -s)

	if [ "$os_name" = "Darwin" ]; then
		gum log --time rfc822  --structured --level debug "Updating Homebrew..."
		brew bundle
		brew update && brew upgrade
		gum log --time rfc822  --structured --level debug "Done"
		break
	fi

	if [ "$os_name" = "Linux" ]; 
	then
		if [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then
			gum log --time rfc822  --structured --level debug "Updating APT packages..."
			sudo apt install zsh tmux curl
			chsh -s /bin/zsh
			sudo apt update && sudo apt upgrade -y
			gum log --time rfc822  --structured --level debug "Done"
			break
		elif [ "$ID" = "centos" ]; then
			gum log --time rfc822  --structured --level debug "Updating YUM packages..."
			sudo yum install zsh tmux curl
			chsh -s /bin/zsh
			sudo yum update -y
			gum log --time rfc822  --structured --level debug "Done"
			break
		elif [ "$ID" = "fedora" ]; then
			gum log --time rfc822  --structured --level debug "Updating DNF packages..."
			sudo dnf install zsh tmux curl
			chsh -s /bin/zsh
			sudo dnf update -y
			gum log --time rfc822  --structured --level debug "Done"
			break
		fi
	fi
	gum log --time rfc822  --structured --level error "Could not determine the Linux distribution."
	return
}

gum style \
	--foreground 212 --border-foreground 212 --border double \
	--align center --width 50 --margin "1 2" --padding "2 4" \
	'Ciarafair Dotfiles'

echo 'Hush login message?'| gum format -t template

HUSHBOOL=$(gum choose --limit 1 Yes No)

if [ $HUSHBOOL = "Yes" ]; then
	gum log --time rfc822  --structured --level debug "Hushing login message..."
	$(hushlogin)
else
	gum log --time rfc822  --structured --level debug "Skipping hushlogin()"
fi

$(symlink)
$(update_os)

exit 0