alias vi='vim'
alias dstat='docker ps --format={{.Names}} | xargs docker stats'
export TERM=xterm-256color
export VISUAL=vim
export EDITOR=vim
alias cha="chmod a+rwX -R ."


function mssh () {
  let i=0
  for var in "$@"
  do
    if [ $i !=  0 ]; then
      tmux split-window
    fi
    tmux send-keys -t $i "ssh -o 'StrictHostKeyChecking no' $var" Enter
    tmux select-layout tiled
    let i=$i+1
  done 
  tmux select-layout tiled
  tmux set-window-option synchronize-panes
}
