hash -d r="$HOME/repos"
hash -d w="$HOME/work"

setopt interactivecomments

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

alias rspec='LOCAL_VIRTUAL_HOST="lvh.me" bin/rspec'

alias tf=terraform

alias ...='../..'
alias ....='../../..'
alias .....='../../../..'

# postgres start / stop
alias postgres.start="brew services start postgresql"
alias postgres.stop="brew services stop postgresql"

alias redis.start="redis-server /usr/local/etc/redis.conf --daemonize yes"

update() {
  brew update
  brew upgrade
  brew upgrade --cask
  antibody update
  nvim +PlugInstall +qall > /dev/null
  rustup update
  softwareupdate --all --install --force
}

note() { e /Users/davidhamp-gonsalves/repos/notes/default.md }
notes() { e /Users/davidhamp-gonsalves/repos/notes/ }
