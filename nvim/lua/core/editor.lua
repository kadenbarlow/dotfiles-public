vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.cursorline = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"
-- vim.opt.textwidth = 120

vim.api.nvim_set_option("clipboard","unnamed") -- copy to system clipboard from vim

vim.api.nvim_create_autocmd({ "BufWritePre" }, { -- remove extra whitespace in file on save
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.g.codeium_enabled = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.shell = "/bin/zsh"
vim.opt.wrapscan = false

vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

vim.opt.title = true
vim.opt.titlestring = "%<%f%r%m"
