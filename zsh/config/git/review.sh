function review() {
  git fetch
  gh pr checkout --detach "$1"
  local base="$(gh pr view $1 --json baseRefName | jq -r '.baseRefName')"
  echo "$base" >/tmp/git-comment-base.txt

  git rev-parse HEAD >/tmp/git-comment-sha.txt
  git merge "origin/$base" -m "PR #$1 Review"
  echo "$1" >/tmp/git-comment-pr.txt
  gh pr view "$1"
}
