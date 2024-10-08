if [ ! "$(command -v aescrypt)" ]; then
  if [ "$(command -v paescrypt)" ]; then
    echo "Insert password to update paescrypt to aescrypt symlink:"
    sudo ln -sf $(which paescrypt) /usr/local/bin/aescrypt
  fi
fi

encryptionkey(){echo $(bw get item 'cli-encryption-password' | jq '.notes' --raw-output)}
bitwarden() {
  local command="$(bw unlock | grep "$ export")"
  command="${command:1}"
  eval "$command"
}

encrypt() { aescrypt -e -p $(encryptionkey) $1 }

encrypt_dir() {
  temp="$1.tar.gz"
  tar -cvzf $temp $1
  aescrypt -e -p $(encryptionkey) $temp
  rm $temp
}
encrypt_all() {
  for file in *; do
    if [ -f "$file" ]; then
      encrypt "$file"
    fi
  done
}

decrypt() { aescrypt -d -p $(encryptionkey) $1 }

decrypt_dir() {
  aescrypt -d -p $(encryptionkey) $1
  directory=$(echo "$1" | cut -f 1 -d '.')
  tar -xvzf "$directory.tar.gz"
  rm "$directory.tar.gz"
}

decrypt_all() {
  for file in *; do
    if [ -f "$file" ]; then
        decrypt "$file"
    fi
  done
}
