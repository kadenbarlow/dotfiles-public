alias dotfiles="cd ~/.dotfiles"
alias myip="ifconfig en0 | awk '\$1 == \"inet\" {print \$2}'"
alias scripts="jq '.scripts' package.json"
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias uuid="uuidgen | awk '{print tolower(\$0)}' | pbcopy && pbpaste | cat -"
alias vim="nvim"
alias vi="nvim"
alias vim-benchmarks="nvim --startuptime /dev/stdout +qall;time vim +q;"
alias download-m4b-tool='docker pull sandreas/m4b-tool:latest'
alias m4b-tool='docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/mnt sandreas/m4b-tool:latest'
alias m4b-tool-merge='m4b-tool merge -v --jobs=6 --output-file="output/" --batch-pattern="input/%g/%a/%s/%p - %n/"  --batch-pattern="input/%g/%a/%n/" "input/"'
alias yt-dl='docker run --rm -i -e PGID=$(id -g) -e PUID=$(id -u) -v "$(pwd)":/workdir:rw mikenye/youtube-dl'

if [ "$(command -v eza)" ]; then
    unalias -m 'll'
    unalias -m 'l'
    unalias -m 'la'
    unalias -m 'ls'
    alias ls='eza -G  --color auto --icons -a -s type'
    alias ll='eza -l --color always --icons -a -s type'
fi

if [ "$(command -v bat)" ]; then
  unalias -m 'cat'
  alias cat='bat -pp --theme="ansi"'
fi

alias documents="cd ~/Documents"
setopt null_glob
for i in ~/Documents/*/ ~/Documents/projects/*/ ~/Documents/work/*/; do
  for dir in $i; do
    dir=${dir%*/} # remove the trailing "/"
    alias ${dir##*/}="cd ${dir}"
  done
done

function copyssh(){ openssl rsa -in $1 | pbcopy }
function onport(){ lsof -i :$1 -S }
function setenv() { export $(cat $1 | xargs) }
function rgbcolors() { for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f" }
