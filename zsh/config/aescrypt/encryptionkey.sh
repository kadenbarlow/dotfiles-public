function encryptionkey() {echo $(bw get item 'cli-encryption-password' | jq '.notes' --raw-output)}
