function set-title() {
  local title="${1:0:20}" # Truncate to 20 characters
  echo -ne "\033]0;${title}\007"
}
