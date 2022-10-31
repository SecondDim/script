#/bin/bash

set -e

echo "=================================================="
echo "========== init update ==========================="
echo "=================================================="

sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

echo "=================================================="
echo "========== download file ========================="
echo "=================================================="

set -x

curl https://raw.githubusercontent.com/SecondDim/script/main/.bash_aliases > ~/.bash_aliases

set +x

echo "=================================================="
echo "========== set aws ntp ==========================="
echo "=================================================="

# set aws ntp
sudo apt install chrony

set -x

match="#\ See\ http:\/\/www.pool.ntp.org\/join.html for more information."
insert="server\ 169.254.169.123\ prefer\ iburst\ minpoll\ 4\ maxpoll\ 4"
file="/etc/chrony/chrony.conf.bak"

sudo sed -i "s/$match/$match\n$insert/" $file

sudo /etc/init.d/chrony restart

set +x

echo "========== [script done] ========================="
