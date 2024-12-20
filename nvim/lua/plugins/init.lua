require("plugins.autotag")
require("plugins.catppuccin") -- enable this and comment nordic below to switch themes
require("plugins.cloak")
-- require("plugins.nordic") -- this needs to come before indent
require("plugins.codeium")
require("plugins.formatter")
require("plugins.hop")
require("plugins.lsp")
require("plugins.neotree") -- this needs to come last
require("plugins.oil")
require("plugins.pairs")
require("plugins.refactoring")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.treesj")
vim.cmd.source("~/.dotfiles/nvim/lua/plugins/fugitive.vim")
require("plugins.colorizer")
vim.cmd.source("~/.dotfiles/nvim/lua/plugins/surround.vim")
