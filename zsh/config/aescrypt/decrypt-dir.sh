decrypt-dir() {
  aescrypt -d -p $(encryptionkey) $1
  directory=$(echo "$1" | cut -f 1 -d '.')
  tar -xvzf "$directory.tar.gz"
  rm "$directory.tar.gz"
}
