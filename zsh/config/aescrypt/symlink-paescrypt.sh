if [ ! "$(command -v aescrypt)" ]; then
  if [ "$(command -v paescrypt)" ]; then
    echo "Insert password to update paescrypt to aescrypt symlink:"
    sudo ln -sf $(which paescrypt) /usr/local/bin/aescrypt
  fi
fi
