alias current_branch="git branch | sed -n -e 's/^\* \(.*\)/\1/p'"

alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gap="git add -p"
alias gb="git branch"
alias gbd="git branch -d"
alias gc="git commit -v"
alias gc!="git commit -v --amend"
alias gcm="git commit -v -m"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gcom="git checkout master"
alias gcos="git checkout staging"
alias gf="git fetch"
alias gfo="git fetch origin"
alias gfa="git fetch --all --prune"
alias gfb="git-fuzzy branch"
alias gfs="git fuzzy status"
alias gm="git merge"
alias gp="git push"
alias gpsu="git push --set-upstream origin \$(current_branch)"
alias gl="git pull"
alias grh="git reset --hard origin/\$(current_branch)"
alias grs="git reset --soft HEAD^"
alias gs="git status"

alias b="git branch"
alias bc="git checkout -b"
alias bx="git branch -d"
alias bco="git checkout"
alias cc=" git commit "
alias gs="git status"
alias f="git fetch --prune origin"
alias Fu="git pull"
alias li="git diff --cached --stat"
alias mm="git merge"
alias pu="git push"
alias pp="git push --set-upstream origin"
alias S="git add ."
alias s="git add"
alias x="git reset --soft HEAD^"
alias X="git reset --hard"
alias z="git stash list"
alias za="git stash apply"
alias zk="git stash drop"
alias zz="git stash save"

alias gbds="git fetch -p &&  \
            git branch --merged master >/tmp/merged_branches && \
            vim /tmp/merged_branches && \
            cat /tmp/merged_branches | \
            xargs -I {branch} git branch -D {branch}"

alias xdb="gbds"

alias gbDs="git fetch -p &&  \
            git branch >/tmp/all_branches && \
            vim /tmp/all_branches && \
            cat /tmp/all_branches | \
            xargs -I {branch} git branch -D {branch}"

alias xDb="gbDs"

alias gh-delete-caches="gh cache list | awk '{print \$1}' | xargs -L 1 gh cache delete"

PATH="$HOME/.antigen/bundles/bigH/git-fuzzy/bin:$PATH"
