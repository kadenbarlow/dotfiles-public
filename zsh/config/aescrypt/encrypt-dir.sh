function encrypt-dir() {
  temp="$1.tar.gz"
  tar -cvzf $temp $1
  aescrypt -e -p $(encryptionkey) $temp
  rm $temp
}
