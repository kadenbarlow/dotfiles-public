#! /usr/bin/env zsh

/opt/homebrew/bin/aerospace list-workspaces --monitor 1 |
  xargs -I {workspace} \
    sh -c "/opt/homebrew/bin/aerospace list-windows --workspace {workspace} | \
           head -n 1 | \
           awk '{print \$1}' | \
           xargs /opt/homebrew/bin/aerospace layout h_tiles --window-id"

/opt/homebrew/bin/aerospace list-workspaces --monitor 2 |
  xargs -I {workspace} \
    sh -c "/opt/homebrew/bin/aerospace list-windows --workspace {workspace} | \
           head -n 1 | \
           awk '{print \$1}' | \
           xargs /opt/homebrew/bin/aerospace layout v_tiles --window-id"
