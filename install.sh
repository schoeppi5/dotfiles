#!/bin/bash

# START

# updates
sudo apt update
sudo apt upgrade

# install tools

for tool in ./install.d/*.sh; do
    out=$(sudo source $tool)
    if [ $? ne 0 ]; then
        printf "Failed to execute script $tool. Output: $out"
    fi
done

for conf in ./home/*; do
    printf "Linking $conf"
    ln -s $conf $HOME/
done