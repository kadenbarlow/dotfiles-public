function decrypt() { aescrypt -d -p $(encryptionkey) $1 }
