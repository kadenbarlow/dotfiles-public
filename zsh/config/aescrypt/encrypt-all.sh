function encrypt-all() {
  for file in *; do
    if [ -f "$file" ]; then
      encrypt "$file"
    fi
  done
}
