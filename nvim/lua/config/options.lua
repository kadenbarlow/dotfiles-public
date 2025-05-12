vim.api.nvim_create_autocmd({"BufWritePre"}, {pattern = {"*"}, command = [[%s/\s\+$//e]]}) -- remove extra whitespace in file on save
vim.api.nvim_set_option("clipboard", "unnamed") -- copy to system clipboard from vim
vim.g.codeium_enabled = true -- can be toggled with <leader>tc
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.backup = false
vim.opt.colorcolumn = "120"
vim.api.nvim_create_autocmd({"BufEnter"}, {pattern = {"*.lua"}, command = [[syntax match spaces /  / conceal cchar= ]]})
vim.api.nvim_create_autocmd({"BufEnter"}, {pattern = {"*.lua"}, command = [[set conceallevel=1]]})
vim.opt.concealcursor = "nvi" -- works with the autocommand above and conceallevel option below to dispaly four spaces as two
vim.opt.cursorline = true -- highlights the line that the cursor is on
vim.opt.expandtab = true -- use spaces instead of tabs when pressing tab key
-- vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.foldcolumn = "1"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"
vim.opt.guicursor = "" -- use default terminal cursor
vim.opt.hlsearch = true -- highlight all occurances of search
vim.opt.ignorecase = true -- ignore case when searching, works with smartcase below
vim.opt.iskeyword:append("-")
vim.opt.incsearch = true -- show where search matches as typing instead of waiting for enter
vim.opt.isfname:append("@-@")
vim.opt.nu = true -- enable line numbers
vim.opt.relativenumber = false
vim.opt.scrolloff = 8
vim.opt.shell = "/bin/zsh"
vim.opt.shiftwidth = 2 -- number of spaces inserted when pressing tab
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true -- makes searches case sensitive when uppercase letters are included
vim.opt.smartindent = true -- indent when starting a new line
vim.opt.softtabstop = 2 -- number of spaces that a tab counts for
vim.opt.swapfile = false
vim.opt.tabstop = 2 -- number of spaces that a tab counts for
vim.opt.termguicolors = true
vim.opt.title = true -- enables showing title in tmux pane status bar
vim.opt.titlestring = "%{expand('%:p:~:.:h:h:t')}/%{expand('%:p:~:.:h:t')}/%{expand('%:t')}%r%m"
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.wrap = false -- can be toggled on and off with <leader>tw
vim.opt.wrapscan = false -- disable searches wrapping around the end of the file instead says no more matches
