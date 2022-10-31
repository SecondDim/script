#/bin/bash

set -e

sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

curl -s https://raw.githubusercontent.com/SecondDim/script/main/.bash_aliases > ~/.bash_aliases
