vim.api.nvim_create_autocmd({"BufWritePre"}, {pattern = {"*"}, command = [[%s/\s\+$//e]]}) -- remove extra whitespace in file on save
vim.api.nvim_set_option("clipboard", "unnamed") -- copy to system clipboard from vim
vim.g.codeium_enabled = true -- can be toggled with <leader>tc
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.backup = false
vim.opt.colorcolumn = "120"
vim.opt.cursorline = true
vim.opt.expandtab = true -- use spaces instead of tabs when pressing tab key
-- vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.foldcolumn = "1"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"
vim.opt.guicursor = ""
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.isfname:append("@-@")
vim.opt.nu = true -- enable line numbers
vim.opt.relativenumber = false
vim.opt.scrolloff = 8
vim.opt.shell = "/bin/zsh"
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.titlestring = "%{expand('%:p:~:.:h:h:t')}/%{expand('%:p:~:.:h:t')}/%{expand('%:t')}%r%m"
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.wrap = false -- can be toggled on and off with <leader>tw
vim.opt.wrapscan = false
