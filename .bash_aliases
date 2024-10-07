alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

alias rebash="exec $SHELL -l"
alias ip='curl http://checkip.amazonaws.com; curl ifconfig.me/ip; echo '
alias rand='openssl rand -base64 48'

alias gfa="git fetch --all --prune"
alias gc="git checkout"
alias gcd="git checkout -B develop origin/develop"
alias gccd="git checkout -B develop cathaybc/develop"
alias gp="git push"

alias dc='docker'
alias dcc='docker-compose'
alias dcpp='docker rm -f $(docker ps -aq); docker volume prune -f;docker network prune -f;'

alias ptt="ssh bbsu@ptt.cc"

p() {
        curl -sL --cookie "over18=1" https://www.ptt.cc/bbs/Gossiping \
        | grep -A 2 '<div class="title">' \
        | grep '</a>' | awk -F"href=\"" '{print $2}' \
        | awk -F"\">" '{print $1,$2}' \
        | awk -F"</a>" '{print $1}'
}

pa() {
        curl -sL --cookie "over18=1" https://www.ptt.cc/bbs/ALLPOST/index.html \
        | grep -A 2 '<div class="title">' \
        | grep '</a>' \
        | awk -F"href=\"" '{print $2}' \
        | awk -F"\">" '{print $1,$2}' \
        | awk -F"</a>" '{print $1}'
}

pp() {
        curl -sL --cookie "over18=1" https://www.ptt.cc"$1" \
        | awk -v RS='<[^>]+>|<script.+script>' -v ORS= '{ if ($0 ~ /\S/) print } END { print "\n" }'
}

hostip=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
port=8080

PROXY_SOCKS="socks5://${hostip}:${port}"
PROXY_HTTP="http://${hostip}:${port}"

set_proxy(){
        export http_proxy="${PROXY_HTTP}"
        export HTTP_PROXY="${PROXY_HTTP}"

        export https_proxy="${PROXY_HTTP}"
        export HTTPS_PROXY="${PROXY_HTTP}"

        export ftp_proxy="${PROXY_HTTP}"
        export FTP_PROXY="${PROXY_HTTP}"
}

unset_proxy(){
        unset http_proxy
        unset HTTP_PROXY
        unset https_proxy
        unset HTTPS_PROXY
        unset ftp_proxy
        unset FTP_PROXY
}

alias proxy="set_proxy;"
alias unproxy="unset_proxy;"
