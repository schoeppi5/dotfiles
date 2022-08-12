#!/bin/bash

# install zsh
apt install zsh

# change shell
chsh -s $(which zsh)

# install oh-my-zsh
eval $(curl -fsSL "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh")