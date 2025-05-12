alias current-branch="git branch | sed -n -e 's/^\* \(.*\)/\1/p'"
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
alias gcom="git checkout master"
alias gcos="git checkout staging"
alias gf="git fetch"
alias gfo="git fetch origin"
alias gfa="git fetch --all --prune"
alias gm="git merge"
alias gp="git push"
alias gpsu="git push --set-upstream origin \$(current-branch)"
alias gl="git pull"
alias grh="git reset --hard origin/\$(current-branch)"
alias grs="git reset --soft HEAD^"
alias gs="git status"
alias gbds="git fetch -p &&  \
  git branch --merged master >/tmp/merged_branches && \
  vim /tmp/merged_branches && \
  cat /tmp/merged_branches | \
  xargs -I {branch} git branch -D {branch}"
alias gbDs="git fetch -p &&  \
  git branch >/tmp/all_branches && \
  vim /tmp/all_branches && \
  cat /tmp/all_branches | \
  xargs -I {branch} git branch -D {branch}"
alias gh-delete-caches="gh cache list | awk '{print \$1}' | xargs -L 1 gh cache delete"
