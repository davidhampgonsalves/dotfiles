hash -d r="$HOME/repos"
hash -d w="$HOME/work"

setopt interactivecomments

#alias ag='ag --path-to-ignore ~/.agignore'
alias rg='rg --smart-case'
ff () { rg -l $* }
fff () { rg -M 150 $* }

alias e=nvim
alias t=tmux

alias g=git
alias gcm='git commit --message'
alias gca='git commit --amend'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias gs='git status'
alias gb='git branch -a | fzf-tmux'
alias grb='git rebase'

alias ...='../..'
alias ....='../../..'
alias .....='../../../..'


# postgres start / stop
alias postgres.start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias postgres.stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

alias redis.start="redis-server /usr/local/etc/redis.conf --daemonize yes"

update() {
  brew update
  brew upgrade
  brew cask upgrade
  antibody update
  nvim +PlugInstall +qall > /dev/null
  rustup update
}

sync-notes() {
  cd /Users/davidhamp-gonsalves/repos/notes

  # wait 5 minutes after change and if after that there are still changes then commit them
  let "sec = 5 * 60"
  sleep $sec
  gstatus=`git status --porcelain`
  if [ ${#gstatus} -ne 0 ]
  then
    git add --all
    git commit -m "auto sync"
    git pull --rebase
    git push
  fi
}
sync-notes &

fswatch fswatch -e ".*" -i ".*/[^.]*\\.md$" /Users/davidhamp-gonsalves/repos/notes | xargs -0 -n 1 zsh -c sync-notes &
note() { e /Users/davidhamp-gonsalves/repos/notes/Readme.md }
junk() { e "/Users/davidhamp-gonsalves/repos/notes/nonsense-little-junk-things.md" }
notes() { e /Users/davidhamp-gonsalves/repos/notes/ }
