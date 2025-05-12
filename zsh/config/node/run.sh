function run() {
  if [[ -n "$@" ]]; then
    npm run "$@"
  else
    local script
    script=$(jq -r '.scripts | keys[]' package.json |
      fzf \
        --preview="jq -r --arg s {} '.scripts[\$s]' package.json" \
        --preview-window=down:2)
    if [[ -n "$script" ]]; then
      npm run "$script"
    fi
  fi
}
