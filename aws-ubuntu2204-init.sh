#/bin/bash

set -e

# init
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

echo "=================================================="

# download file
curl -s https://raw.githubusercontent.com/SecondDim/script/main/.bash_aliases > ~/.bash_aliases

echo "=================================================="

# set aws ntp
sudo apt install chrony

match="#\ See\ http:\/\/www.pool.ntp.org\/join.html for more information."
insert="server\ 169.254.169.123\ prefer\ iburst\ minpoll\ 4\ maxpoll\ 4"
file="/etc/chrony/chrony.conf.bak"

sudo sed -i "s/$match/$match\n$insert/" $file

sudo /etc/init.d/chrony restart

echo "=================================================="
