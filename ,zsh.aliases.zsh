hash -d r="$HOME/repos"
hash -d w="$HOME/work"

# mdfind in current director omitting excludes
# ff () { mdfind -onlyin . $* | grep -v -f ~/.search-exclude.txt }
alias ag='ag --path-to-ignore ~/.agignore'
ff () { ag -l $* }

# grep excluding common code library locations
ffg () { grep -R -I --exclude-dir=vendor/bundle/ --exclude-dir=node_modules/ $* . }

alias e=nvim
alias t=tmux

alias g=git
alias gcm='git commit --message'
alias gco='git checkout'

# postgres start / stop
alias postgres.start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias postgres.stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
