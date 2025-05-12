function decrypt-all() {
  for file in *; do
    if [ -f "$file" ]; then
      decrypt "$file"
    fi
  done
}
