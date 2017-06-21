#!/bin/bash

# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

brew install zsh
brew install git
brew install wget
brew install coreutils
brew install vim
brew install rbenv
brew install ruby-build
brew install tmux
brew install ack
brew install ag
brew install tig
brew install peco
brew install curl
brew install flow
brew install reattach-to-user-namespace

brew cleanup

# oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# vundle
# need to launch vim and run :PluginInstall
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# link
./dotfilesLink.sh
