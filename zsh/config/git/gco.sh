unalias gco
function gco() {

  if [[ -n "$1" ]]; then
    git checkout "$1"
    return
  fi

  current_branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  all_local_branches=("${(@f)$(git for-each-ref --format='%(refname:short)' refs/heads/)}")

  checked_out_branches=()
  for branch in ${(u)${(@f)$(git reflog | grep 'checkout:' | awk '{print $NF}' | grep -v '^-' )}}; do
    if [[ " ${all_local_branches[@]} " == *" $branch "* ]]; then
      checked_out_branches+=("$branch")
    fi
  done

  for branch in "${checked_out_branches[@]}"; do
    all_local_branches=(${all_local_branches:#$branch})
  done

  branches=("${checked_out_branches[@]}" "${all_local_branches[@]}")

  selected=$(printf "%s\n" "${branches[@]}" | fzf --preview 'git log -5 --oneline --decorate --color=always {}' --preview-window=down:5:wrap)

  if [[ -n "$selected" ]]; then
    git checkout "$selected"
  fi
}
