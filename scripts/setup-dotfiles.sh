mkdir -p ~/.config/atuin
mkdir -p ~/.config/karabiner/assets/complex_modifications
mkdir -p ~/.config/nvim
mkdir -p ~/.config/kitty
mkdir -p ~/.config/posting
mkdir -p ~/.local/share/posting
mkdir -p /opt/homebrew/etc

rm -rf ~/.local/share/posting/default

ln -sf $PWD/amazonq.json ~/Library/Application\ Support/amazon-q/settings.json
ln -sf $PWD/atuin.toml ~/.config/atuin/config.toml
ln -sf $PWD/caddyfile /opt/homebrew/etc/Caddyfile
ln -sf $PWD/kitty.conf ~/.config/kitty/kitty.conf
ln -sf $PWD/tmux.conf ~/.tmux.conf

ln -sf $PWD/aerospace.toml ~/.aerospace.toml
ln -sf $PWD/git/gitconfig ~/.gitconfig
ln -sf $PWD/hammerspoon ~/.hammerspoon
ln -sf $PWD/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
ln -sf $PWD/karabiner/caps.json ~/.config/karabiner/assets/complex_modifications/caps.json
ln -sf $PWD/nvim ~/.config/nvim
ln -sf $PWD/posting/config.yaml ~/.config/posting/config.yaml
ln -s $PWD/posting/collections ~/.local/share/posting/default
ln -sf $PWD/zsh/zshrc ~/.zshrc

touch $HOME/.work.sh
