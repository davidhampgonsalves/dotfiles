hash -d r="$HOME/repos"
hash -d w="$HOME/work"

alias ag='ag --path-to-ignore ~/.agignore'
ff () { ag -l $* }
fff () { ag $* }

alias e=nvim
alias t=tmux

alias g=git
alias gcm='git commit --message'
alias gca='git commit --amend'
alias gco='git checkout'
alias gs='git status'
alias gb='git branch -a | fzf-tmux'

alias ...='../..'
alias ....='../../..'
alias .....='../../../..'

# postgres start / stop
alias postgres.start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias postgres.stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

alias redis.start="redis-server /usr/local/etc/redis.conf --daemonize yes"
