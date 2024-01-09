#!/bin/sh

echo "Symlinking dotfiles..."

if ! [ -d $HOME/.backups ]
then
    echo "Backup directory does not exist"
    mkdir $HOME/.backups
fi

if [ -f $HOME/.gitconfig ]
then
    echo "File .gitconfig exists. Backing up..."
    if [ -f $HOME/.backups/.gitconfig.bak ]
    then
        echo ".gitconfig backup file exists."
        rm -rf $HOME/.backups/.gitconfig.bak
    fi
    mv $HOME/.gitconfig $HOME/.backups/.gitconfig.bak
fi
ln -sf $HOME/.dotfiles/git/.gitconfig $HOME/.gitconfig

if [ -f $HOME/.zshenv ]
then
    echo "File .zshenv exists. Backing up..."
    if [ -f $HOME/.backups/.zshenv.bak ]
    then
        echo ".zshenv backup file exists"
        rm -rf $HOME/.backups/.zshenv.bak
    fi
    mv $HOME/.zshenv $HOME/.backups/.zshenv.bak
fi
ln -sf $HOME/.dotfiles/zsh/.zshenv $HOME/.zshenv

if [ -f $HOME/.zshrc ]
then
    echo "File .zshrc file exists. Backing up..."
    if [ -f $HOME/.backups/.zshrc.bak ]
    then
        echo ".zshrc backup file exists."
        rm -rf $HOME/.backups/.zshrc.bak
    fi
    mv $HOME/.zshrc $HOME/.backups/.zshrc.bak
fi
ln -sf $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc

if ! [ -d $HOME/.config/zsh ]
then 
    echo "ZSH directory does not exist"
    mkdir $HOME/.config/zsh
fi

if [ -f $HOME/.config/zsh/.zshrc ]
then 
    echo "zsh/.zshrc exist. Backing up."
    if [ -f $HOME/.backups/.zshrc.bak ]
    then
        echo ".zshrc backup file exists."
        rm -rf $HOME/.backups/.zshrc.bak
    fi
fi
ln -sf $HOME/.dotfiles/zsh/.zshrc $HOME/.config/zsh/.zshrc

if [ -f $HOME/.bashrc ]
then
    echo ".bashrc file exists. Backing up..."
    if [ -f $HOME/.backups/.bashrc.bak ]
    then
        echo ".bashrc backup file exists."
        rm -rf $HOME/.backups/.bashrc.bak
    fi
    mv $HOME/.bashrc $HOME/.backups/.bashrc.bak
fi
ln -sf $HOME/.dotfiles/bash/.bashrc $HOME/.bashrc

if [ -d $HOME/.config/tmux ]
then
    echo "Tmux config directory exists."
    if [ -f $HOME/.config/tmux/tmux.conf ]
    then
        echo "Tmux config file exists. Backing up..."

        if ! [ -d $HOME/.backups/tmux ]
        then
            echo "Tmux backup directory does not exist."
            mkdir $HOME/.backups/tmux
        fi
        
        if [ -f $HOME/.backups/tmux/tmux.conf.bak ]
        then
           echo "Tmux backup file exists."
           rm -rf $HOME/.backups/tmux/tmux.conf.bak
        fi        
        
        mv $HOME/.config/tmux/tmux.conf $HOME/.backups/tmux/tmux.conf.bak
    fi
fi
ln -sf $HOME/.dotfiles/tmux $HOME/.config/tmux

if [ -d $HOME/.config/polybar ]
then 
    echo "Polybar config directory exists."
    if [ -f $HOME/.config/polybar/config.ini ]
    then
        echo "Polybar config file exists. Backing up..."

        if ! [ -d $HOME/.backups/polybar ]
        then
            echo "Polybar backup directory does not exist."
            mkdir $HOME/.backups/polybar
        fi

        if [ -f $HOME/.backups/polybar/config.ini.bak ]
        then
            echo "Polybar backup file exists."
            rm -rf $HOME/.backups/polybar/config.ini.bak
        fi

        mv $HOME/.config/polybar/config.ini $HOME/.backups/polybar/config.ini.bak
    fi
else
    echo "Polybar directory does not exist."
    mkdir $HOME/.config/polybar
fi
ln -sf $HOME/.dotfiles/polybar/config.ini $HOME/.config/polybar/config.ini

if [ -d $HOME/.config/neofetch ]
then 
    echo "Neofetch config directory exists."
    if [ -f $HOME/.config/neofetch/config.conf ]
    then
        echo "Neofetch config file exists. Backing up..."
        if ! [ -d $HOME/.backups/neofetch ]
        then
            echo "Neofetch backup directory does not exist."
            mkdir $HOME/.backups/neofetch
        fi

        if [ -f $HOME/.backups/neofetch/config.conf.bak ]
        then
            echo "Neofetch backup file exists."
            rm -rf $HOME/.backups/neofetch/config.conf.bak
        fi

        mv $HOME/.config/neofetch/config.conf $HOME/.backups/neofetch/config.conf.bak
    fi
else
    echo "Neofetch directory does not exist."
    mkdir $HOME/.config/neofetch
fi
ln -sf $HOME/.dotfiles/neofetch/config.conf $HOME/.config/zsh/neofetch/config.conf

if [ -d $HOME/.config/alacritty ]
then
    echo "Alacritty config directory exists"
    if [ -f $HOME/.config/alacritty/alacritty.yml ]
    then
        echo "Alacritty config file exists. Backing up..."
        if ! [ -d $HOME/.backups/alacritty ]
        then
            echo "Alacritty backup directory does not exist"
            mkdir $HOME/.backups/alacritty
        fi

        if [ -f $HOME/.backups/alacritty/alacritty.yml.bak ]
        then
            echo "Alacritty backup file exists"
            rm -rf $HOME/.backups/alacritty/alacritty.yml.bak
        fi

        mv $HOME/.config/alacritty/alacritty.yml $HOME/.backups/alacritty/alacritty.yml.bak
    else
        echo "Alacritty file does not exist"
    fi
else
    echo "Alacritty directory does not exist"
    mkdir $HOME/.config/alacritty
fi
ln -sf $HOME/.dotfiles/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml

if [ -d $HOME/.config/i3 ]
then
    echo "i3 config directory exists"
    if [ -f $HOME/.config/i3/config ]
    then
        echo "i3 config file exists. Backing up..."
        if ! [ -d $HOME/.backups/i3 ]
        then
            echo "i3 backup directory does not exist"
            mkdir $HOME/.backups/i3
        fi

        if [ -f $HOME/.backups/i3/config.bak ]
        then
            echo "i3 backup file exists"
            rm -rf $HOME/.backups/i3/config.bak
        fi

        mv $HOME/.config/i3/config $HOME/.backups/i3/config.bak
    fi
else
    echo "i3 directory does not exist"
    mkdir $HOME/.config/i3
fi
ln -sf $HOME/.dotfiles/i3/config $HOME/.config/i3/config
