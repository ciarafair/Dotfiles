echo "Backing up dotfiles..."
mv $HOME/.config $HOME/.config.bak
mv $HOME/.zshrc $HOME/.backups/.zshenv.bak
mv $HOME/.zshrc $HOME/.backups/.zshrc.bak
mv $HOME/.bashrc $HOME/.backups/.bashrc.bak
mv $HOME/.tmux.conf $HOME/.backups/.tmux.conf.bak
mv $HOME/.vimrc $HOME/.backups/.vimrc.bak
mv $HOME/.yarnrc $HOME/.backups/.yarnrc.bak
mv $HOME/.npmrc $HOME/.backups/.npmrc.bak
mv $HOME/.macos $HOME/.backups/.macos.bak
