hash -d r="$HOME/repos"
hash -d w="$HOME/work"

alias dm='docker-machine'

# mdfind in current director omitting excludes
ff () { mdfind -onlyin . $* | grep -v -f ~/.search-exclude.txt }

# grep excluding common code library locations
ffg () { grep -R --exclude-dir=vendor --exclude-dir=node_modules $* . }
