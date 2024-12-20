mkdir -p ~/.config/atuin
mkdir -p ~/.config/nvim
mkdir -p ~/.config/kitty
mkdir -p ~/.config/posting
mkdir -p ~/.local/share/posting
rm -rf ~/.local/share/posting/default

ln -sf $PWD/aerospace/aerospace.toml ~/.aerospace.toml
ln -sf $PWD/zsh/atuin.toml ~/.config/atuin/config.toml
ln -sf $PWD/git/gitconfig ~/.gitconfig
ln -sf $PWD/hammerspoon ~/.hammerspoon
ln -sf $PWD/pylintrc ~/.pylintrc
ln -sf $PWD/ruby/irbrc ~/.irbrc
ln -sf $PWD/ruby/rubocop.yml ~/.rubocop.yml
ln -sf $PWD/tmux.conf ~/.tmux.conf
ln -sf $PWD/nvim ~/.config/nvim
ln -sf $PWD/zsh/zshrc ~/.zshrc
ln -sf $PWD/zsh/kitty.conf ~/.config/kitty/kitty.conf
ln -sf $PWD/posting/config.yaml ~/.config/posting/config.yaml
ln -s $PWD/posting/collections ~/.local/share/posting/default

mkdir -p ~/.config/karabiner/assets/complex_modifications
ln -sf $PWD/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
ln -sf $PWD/karabiner/caps.json ~/.config/karabiner/assets/complex_modifications/caps.json

# mkdir -p ~/Library/Preferences/k9s
# ln -sf $PWD/k9s/skin.yml ~/Library/Application\ Support/k9s/skin.yml
# ln -sf $PWD/k9s/plugin.yml ~/Library/Application\ Support/k9s/plugin.yml

mkdir -p ~/Library/Application\ Support/amazon-q
ln -sf $PWD/zsh/config/amazonq.json ~/Library/Application\ Support/amazon-q/settings.json

touch $HOME/.work.sh
