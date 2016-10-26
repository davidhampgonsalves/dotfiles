hash -d r="$HOME/repos"
hash -d w="$HOME/work"

alias dm='docker-machine'

# mdfind in current director omitting excludes
# ff () { mdfind -onlyin . $* | grep -v -f ~/.search-exclude.txt }
ff () { ag -l $* }

# grep excluding common code library locations
ffg () { grep -R -I --exclude-dir=vendor/bundle/ --exclude-dir=node_modules/ $* . }

# postgres start / stop
alias postgres.start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias postgres.stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
