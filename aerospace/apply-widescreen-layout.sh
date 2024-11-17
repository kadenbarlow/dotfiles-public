#! /usr/bin/env zsh

/opt/homebrew/bin/aerospace list-workspaces --all |
  xargs -I {workspace} \
    sh -c "/opt/homebrew/bin/aerospace list-windows --workspace {workspace} | \
           head -n 1 | \
           awk '{print \$1}' | \
           xargs /opt/homebrew/bin/aerospace layout h_tiles --window-id"
