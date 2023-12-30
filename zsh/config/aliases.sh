alias dotfiles="cd ~/.dotfiles"
alias myip="ifconfig en0 | awk '\$1 == \"inet\" {print \$2}'"
alias lineselect="cat >/tmp/lineselect && vim /tmp/lineselect && cat /tmp/lineselect"
alias ngrk="ngrok http"
alias scripts="jq '.scripts' package.json"
alias uuid="uuidgen | awk '{print tolower(\$0)}' | pbcopy && pbpaste | cat -"
alias vim="nvim"
alias vi="nvim"
alias vim-benchmarks="nvim --startuptime /dev/stdout +qall"

if [ "$(command -v exa)" ]; then
    unalias -m 'll'
    unalias -m 'l'
    unalias -m 'la'
    unalias -m 'ls'
    alias ls='exa -G  --color auto --icons -a -s type'
    alias ll='exa -l --color always --icons -a -s type'
fi

if [ "$(command -v bat)" ]; then
  unalias -m 'cat'
  alias cat='bat -pp --theme="ansi"'
fi

copyssh(){ openssl rsa -in $1 | pbcopy } # decrypts an ssh key and copies to clipboard
onport(){ lsof -i :$1 -S }
setenv() { export $(cat $1 | xargs) }
rgbcolors() { for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f" }

alias gitstatus="git status --porcelain"
alias fzf-gitdiff="fzf --multi --preview \"echo {} | xargs git diff --color=always\""
alias fzf-gitdiffstaged="fzf --multi --preview \"echo {} | xargs git diff --staged --color=always\""
alias col2="awk '{print \$2}'"

alias grm="gitstatus | fzf --multi | col2 | xargs rm -rf"
alias gvim="vim \$(gitstatus | col2 | fzf-gitdiff)"
alias greset="git diff --name-only --cached | fzf-gitdiffstaged | xargs git reset"
alias gadd="git ls-files --modified | fzf-gitdiff | xargs git add"
alias gcheckout="gitstatus | fzf-gitdiff | col2 | xargs git checkout"
alias acme.sh="~/.acme.sh/acme.sh"
