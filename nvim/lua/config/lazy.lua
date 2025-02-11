local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo(
            {
                {"Failed to clone lazy.nvim:\n", "ErrorMsg"},
                {out, "WarningMsg"},
                {"\nPress any key to exit..."}
            },
            true,
            {}
        )
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        spec = {
            {"nvim-lua/plenary.nvim", priority = 1000}, -- needed by many other plugins as a dependency
            -- Telescope Plugins
            {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}, -- faster and more accurate fuzzy searching
            {"nvim-telescope/telescope-live-grep-args.nvim"}, -- pass args into telescope for searching by glob, type
            {"nvim-telescope/telescope.nvim", tag = "0.1.4"}, -- all things searching
            {"princejoogie/dir-telescope.nvim"}, -- limit telescope searches to directories
            --- Navigation Plugins
            {"folke/flash.nvim", event = "VeryLazy"}, -- jump to location by key combo
            {"ThePrimeagen/harpoon"}, -- bookmark and jump between several files
            {"stevearc/oil.nvim"}, -- edit directory structure as a buffer
            -- Text Editing Plugins
            {"AndrewRadev/splitjoin.vim"}, -- used as a backup to treesj to join and split lines
            {"ThePrimeagen/refactoring.nvim"}, -- adds debug statements based on language, and other refactoring commands
            {"Wansmer/treesj"}, -- used with splitjoin as backup to join and split objects
            {"tpope/vim-abolish"}, -- string inflection commands
            {"tpope/vim-commentary"}, -- comment out lines of code
            {"tpope/vim-fugitive"}, -- git functionality inside of vim
            {"tpope/vim-scriptease"}, -- open messages buffer and other helpful debugging functions
            {"tpope/vim-sleuth"}, -- automatically detect indentation based on the current file
            {"tpope/vim-surround"}, -- change and add quotes and braces to selection
            -- Plugins for auto-closing blocks, tags, quotes, etc
            {"RRethy/nvim-treesitter-endwise"}, -- adds end in ruby
            {"andymass/vim-matchup"}, -- extends vims % jumping to language specific keywords like end
            {"echasnovski/mini.pairs"}, -- automatically adds character pairs for quotes and braces etc.
            {"windwp/nvim-ts-autotag", opts = {}}, -- automatically adds html/jsx end tags
            -- Plugins for making the editor look nice
            {"catppuccin/nvim", name = "catppuccin", priority = 1000}, -- amazing looking colorscheme
            {"kadenbarlow/feline.nvim"}, -- amazing looking status bar
            {"kevinhwang91/nvim-ufo", dependencies = {"kevinhwang91/promise-async"}}, -- makes fold look modern
            {"lewis6991/gitsigns.nvim"}, -- git integration in buffers
            {"luukvbaal/statuscol.nvim"}, -- allows clicking of folds to expand and collapse
            {"maxmellon/vim-jsx-pretty"}, -- make jsx look nice
            {"mbbill/undotree"}, -- visually go back through edits
            {"norcalli/nvim-colorizer.lua"}, -- highlight hex and colors in buffers
            {"nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = {"MunifTanjim/nui.nvim"}}, -- filetree sidebar
            {"nvim-tree/nvim-web-devicons"}, -- amazing looking icons
            {"pixelastic/vim-undodir-tree"}, -- fixes an issue with undo behavior with file names that are too long
            -- IDE Functionality
            {"Exafunction/codeium.vim", tag = "1.8.30"}, -- AI coding assistant
            {"L3MON4D3/LuaSnip"}, -- snippet engine
            {"folke/trouble.nvim"}, -- view lsp diagnostics across projects
            {"hrsh7th/cmp-buffer"}, -- adds a nvim-cmp source for text in the buffer
            {"hrsh7th/cmp-nvim-lsp"}, -- adds a nvim-cmp source for the lsp server
            {"hrsh7th/cmp-path"}, -- adds a nvim-cmp source for file paths
            {"hrsh7th/nvim-cmp"}, -- completion plugin providing the dropdown list of options while coding
            {"mhartington/formatter.nvim"}, -- automatic code formatting
            {"neovim/nvim-lspconfig"}, -- repository of neovim lsp configurations
            {"nvim-treesitter/nvim-treesitter"}, -- syntax highlighting
            {"nvim-treesitter/nvim-treesitter-context"}, -- shows code context at top of buffer
            {"saadparwaiz1/cmp_luasnip"}, -- adds a nvim-cmp source for snippets
            {"sindrets/diffview.nvim"}, -- used for in editor github PR reviews
            {"williamboman/mason-lspconfig.nvim"}, -- bridges mason and nvim-lspconfig and makes working with them easy
            {"williamboman/mason.nvim"} -- package manager for installing lsp servers, linters, formatters etc
        },
        checker = {enabled = true},
        install = {colorscheme = {"catppuccin"}}
    }
)
