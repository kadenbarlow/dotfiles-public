alias documents="cd ~/Documents"
setopt null_glob
for i in ~/Documents/*/ ~/Documents/projects/*/  ~/Documents/work/*/
do
  for dir in $i
  do
    dir=${dir%*/}      # remove the trailing "/"
    alias ${dir##*/}="cd ${dir}"
  done
done

function navigate-left() { tmux select-pane -L }
zle -N navigate-left
bindkey -a 'wh' navigate-left

function navigate-down() { tmux select-pane -D }
zle -N navigate-down
bindkey -a 'wj' navigate-down

function navigate-up() { tmux select-pane -U }
zle -N navigate-up
bindkey -a 'wk' navigate-up

function navigate-right() { tmux select-pane -R }
zle -N navigate-right
bindkey -a 'wl' navigate-right

function split-vertical() { tmux split-window -h }
zle -N split-vertical
bindkey -a 'w/' split-vertical

function split-horizontal() { tmux split-window -v }
zle -N split-horizontal
bindkey -a 'w-' split-horizontal
