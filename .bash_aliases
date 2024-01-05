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
