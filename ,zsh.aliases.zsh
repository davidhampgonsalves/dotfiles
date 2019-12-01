hash -d r="$HOME/repos"
hash -d w="$HOME/work"

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

tmux-w () {
  command -v tmux >/dev/null 2>&1 || { printf "Cockpit requires tmux but it is not installed.
  Please check http://cockpit.27ae60.com/help.html for more information.
  Aborting." >&2; exit 1; }

  SESSION=oc

  # if the session is already running, just attach to it.
  tmux has-session -t $SESSION
  if [ $? -eq 0 ]; then
    echo "Session $SESSION already exists. Attaching."
    sleep 1
    tmux -2 attach -t $SESSION
    exit 0;
  fi

  # create a new session, named $SESSION, and detach from it
  tmux -2 new-session -d -s $SESSION

  # Now populate the session with the windows you use every day
  tmux set-option -g base-index 1
  tmux set-window-option -t $SESSION -g automatic-rename off
  tmux set-window-option -g pane-base-index 1

  tmux new-window -t $SESSION:0 -k -n oc

  tmux split-window -h -p 50
  tmux select-pane -t 2
  tmux split-window -v -p 50
  tmux select-pane -t 2
  tmux split-window -v -p 50
  tmux send-keys -t ${window}.1 'cd ~/work/opencounter ; sleep 1 ; e' Enter
  tmux send-keys -t ${window}.2 'cd ~/work/opencounter && postgres.start && redis.start ; bin/rails s -b 0.0.0.0 -p 3000' Enter
  tmux send-keys -t ${window}.3 'cd ~/work/opencounter ; yarn start' Enter
  tmux send-keys -t ${window}.4 'cd ~/work/opencounter' Enter
  tmux set-window-option -t $SESSION:0 automatic-rename off

  # all done. select starting window and get to work
  tmux select-window -t $SESSION:0
  tmux -2 attach -t $SESSION
}

brew-update() {
  brew update
  brew upgrade
  brew cask upgrade
  antibody update
  e +'PlugInstall --sync' +qa
}
