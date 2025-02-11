local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load({paths = "~/.dotfiles/nvim/snippets"})
luasnip.filetype_extend("ruby", {"rails"})
luasnip.filetype_extend("vue", {"vue"})
