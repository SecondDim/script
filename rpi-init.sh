#/bin/bash

set -e

echo "=================================================="
echo "========== init update ==========================="
echo "=================================================="

sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
sudo apt install vim pppoeconf ntpdate

echo "=================================================="
echo "========== download file ========================="
echo "=================================================="

set -x

curl https://raw.githubusercontent.com/SecondDim/script/main/.bash_aliases > ~/.bash_aliases

set +x

echo "=================================================="
echo "========== set ntp && time zone =================="
echo "=================================================="

sudo ntpdate tick.stdtime.gov.tw
sudo timedatectl set-timezone Asia/Taipei
date

echo "=================================================="
echo "========== set ssh ==============================="
echo "=================================================="

mkdir ~/.ssh && cd ~/.ssh
touch authorized_keys
chmod 600 authorized_keys
cd ~
# do it at localhost
# ssh-keygen -t ecdsa -b 521 -f rpi
# cpoy rpi.pub into authorized_keys

# if need
# sudo raspi-config
