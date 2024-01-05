#/bin/bash

set -e

echo "=================================================="
echo "========== shadowsocks ==========================="
echo "=================================================="

mkdir ~/ssr && cd ~/ssr

wget https://github.com/shadowsocks/shadowsocks-rust/releases/download/v1.17.1/shadowsocks-v1.17.1.aarch64-unknown-linux-gnu.tar.xz
tar Jxvf shadowsocks-v1.17.1.aarch64-unknown-linux-gnu.tar.xz

touch shadowsocks.json
# {
#       "server": "0.0.0.0",
#       "mode": "tcp_and_udp",
#       "server_port": 443,
#       "password": "[[set your password]]",
#       "method": "chacha20-ietf-poly1305",
#       "timeout": 3600,
#       "fast_open": true,
#       "plugin": "v2ray-plugin",
#       "plugin_opts": "server;tls;host=ddd.dddddd.dddd.dddd;cert=[path_to_cert]/fullchain.cer;key=[path_to_key]/ddd.dddddd.dddd.dddd.key;"
# }

sudo setcap CAP_NET_BIND_SERVICE=+eip ssserver
# ./ssserver -c shadowsocks.json

echo "=================================================="
echo "========== v2ray-plugin =========================="
echo "=================================================="

mkdir ~/v2ray-plugin && cd ~/v2ray-plugin

wget https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.3.2/v2ray-plugin-linux-arm64-v1.3.2.tar.gz
tar zxvf v2ray-plugin-linux-arm64-v1.3.2.tar.gz

sudo cp v2ray-plugin_linux_arm64 /usr/local/bin/v2ray-plugin

echo "=================================================="
echo "========== acme.sh ==============================="
echo "=================================================="

cd ~
curl https://get.acme.sh | sh

cd .acme.sh/
sudo sysctl net.ipv4.ip_unprivileged_port_start=443
# ./acme.sh --issue --alpn -d ddd.dddddd.dddd.dddd --server letsencrypt --force

# root only
sudo echo "\nnet.ipv4.ip_unprivileged_port_start=80\n" >> /etc/sysctl.d/99-sysctl.conf


echo "=================================================="
echo "========== set systemd ==========================="
echo "=================================================="

cd /etc/systemd/system
sudo touch ssr.service
sudo chmod 644 ssr.service

# [Unit]
# Description=ssr

# [Service]
# User=ben.tsou
# WorkingDirectory=/home/[username]/ssr/
# ExecStart=/home/[username]/ssr/ssserver -c /home/[username]/ssr/shadowsocks.json
# Restart=always

# [Install]
# WantedBy=multi-user.target

sudo systemctl status ssr
# sudo systemctl start ssr

sudo systemctl enable ssr.service

echo "========== [script done] ========================="
