local success = require('core.packages') 
if success then
  require('core.keymap')
  require('core.editor')
  require('core.functions')
  require('core.theme')
  vim.cmd.source('~/.dotfiles/nvim/lua/core/quickfix.vim')
end
