#!/usr/bin/env bash

sudo -v

# Hide "last login" line when starting a new terminal session
touch $HOME/.hushlogin

#--------------------------------------------------
# Shell setup
#--------------------------------------------------
echo -e "\nSymlinking dotfiles"
ln -sf $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf

mkdir -p $HOME/.config/starship
ln -sf $HOME/.dotfiles/starship.toml $HOME/.config/starship.toml

mkdir -p $HOME/.config/ghostty
ln -sf $HOME/.dotfiles/ghostty/config $HOME/.config/ghostty/config

mkdir -p $HOME/.config/nvim
ln -sf $HOME/.dotfiles/nvim/* $HOME/.config/nvim/

mkdir -p $HOME/.config/karabiner
ln -sf $HOME/.dotfiles/karabiner/karabiner.json $HOME/.config/karabiner/karabiner.json

mkdir -p $HOME/.config/zed
ln -sf $HOME/.dotfiles/zed/settings.json $HOME/.config/zed/settings.json
ln -sf $HOME/.dotfiles/zed/keymap.json $HOME/.config/zed/keymap.json

#--------------------------------------------------
# macOS Apps and services
#--------------------------------------------------

# install brew apps
brew bundle

# # install php extensions
# pecl install xdebug

# # Set default MySQL root password and auth type
brew services start mysql # make sure mysql is running
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'root'; FLUSH PRIVILEGES;"

# # install default composer packages
composer self-update
composer global require laravel/installer

# # install go tools
go install github.com/lpheller/mogo@latest

# # Create a default sites / projects directory
mkdir -p $HOME/Sites
mkdir -p $HOME/Projects

# # configure git
[ ! -f ~/.global.gitignore ] && ln -s ~/.dotfiles/.global.gitignore ~/.global.gitignore
git config --global core.excludesfile ~/.global.gitignore
git config --global user.name "Lukas Heller"
git config --global user.email "36259611+lpheller@users.noreply.github.com"
git config --global credential.helper osxkeychain

# # Set macOS preferences - we will run this last because this will reload the shell
source .macos
