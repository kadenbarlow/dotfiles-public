-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local isBootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    isBootstrap = true
    vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print "Failure installing packer"
    return false
end

-- Install your plugins here
packer.startup(
    function(use)
        -- Plugins needed by all other plugins
        use "wbthomason/packer.nvim" -- Have packer manage itself
        use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins listed below

        -- Telescope Plugins
        use {"nvim-telescope/telescope.nvim", tag = "0.1.4"} -- all things searching
        use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"} -- better fuzzy searching than native telescope
        use "nvim-telescope/telescope-live-grep-args.nvim" -- pass arguments into telescope for limiting file type or directory
        use "princejoogie/dir-telescope.nvim" -- used in <leader>sd and <leader>pd to have an interactive picker for searching a specific directory for text or file

        -- Navigation Plugins
        use "phaazon/hop.nvim" -- lets you jump to char by highlight all options in buffer and providing key combo to jump
        use "ThePrimeagen/harpoon" -- jump between several files in use currently
        use "stevearc/oil.nvim" -- edit file tree from a buffer

        -- Plugins for modifying and changing text
        use "tpope/vim-surround" -- change those quotes or braces
        use "tpope/vim-commentary" -- comment lines of code
        use "tpope/vim-fugitive" -- git functions in vim
        use "tpope/vim-abolish" -- string inflection and project refactoring
        use "tpope/vim-sleuth" -- autodetects indentation in a file
        use "tpope/vim-scriptease" -- helpful functions for debugging vimscript and messages
        use "ThePrimeagen/refactoring.nvim" -- refactor code and add debug statements
        use "Wansmer/treesj" -- uses treesitter to join and split lines
        use "AndrewRadev/splitjoin.vim" -- fallback if treesitter doesn't work for joining and splitting lines
        use "chrisbra/NrrwRgn" -- edit a single region of text
        use "laytan/cloak.nvim" -- hide sensitive text in files

        -- Plugins for autoclosing blocks and tags etc
        use "RRethy/nvim-treesitter-endwise" -- add "end" automatically in languages that use it
        use "windwp/nvim-ts-autotag" -- html tag autoclose and refactoring
        use "echasnovski/mini.pairs" -- add closing braces and quotes automatically
        use "andymass/vim-matchup" -- fix % operator to work in languages with weird syntax (like ruby...)
        use "maxmellon/vim-jsx-pretty" -- jsx indentation and highlighting
        use "mhartington/formatter.nvim" -- auto format code on save

        -- Plugins for making the editor look nice
        use "norcalli/nvim-colorizer.lua" -- highlight hex values in buffer with colors
        use {"nvim-tree/nvim-web-devicons"} -- icons in file exporer and statusbar
        use {"nvim-neo-tree/neo-tree.nvim", branch = "v3.x", requires = {"MunifTanjim/nui.nvim"}}
        use "mbbill/undotree" -- visual undotree
        use "pixelastic/vim-undodir-tree" -- fix undo file names being too long
        use {"kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async"} -- visual folding
        use "luukvbaal/statuscol.nvim" -- Used to make folding on the sidebar look good required by nvim-ufo
        use {"catppuccin/nvim", as = "catppuccin"} -- colorscheme
        -- use {"AlexvZyl/nordic.nvim"} -- additional freaking beautiful theme
        use {"freddiehaddad/feline.nvim"} -- statusbar theme
        use {"lewis6991/gitsigns.nvim"} -- git signs

        -- LSP related plugins and configuration
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"} -- syntax highlighting improvements
        use {"nvim-treesitter/nvim-treesitter-context"} -- keep current scope visible on page

        use {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v1.x",
            requires = {
                {"neovim/nvim-lspconfig"},
                {"williamboman/mason.nvim"},
                {"williamboman/mason-lspconfig.nvim"},
                {"hrsh7th/nvim-cmp"},
                {"hrsh7th/cmp-nvim-lsp"},
                {"hrsh7th/cmp-buffer"},
                {"hrsh7th/cmp-path"},
                {"saadparwaiz1/cmp_luasnip"},
                {"hrsh7th/cmp-nvim-lua"},
                {"L3MON4D3/LuaSnip", run = "make install_jsregexp"},
                {"rafamadriz/friendly-snippets"},
                {"folke/neodev.nvim"} -- Additional lua configuration, makes nvim stuff amazing
            }
        }
        use {"folke/trouble.nvim", tag = "v2.10.0"} -- Used with <leader>tt to jump to errors quickly in a file

        use {"Exafunction/codeium.vim", tag = "1.8.30"}

        if isBootstrap then
            require("packer").sync()
        end
    end
)

if isBootstrap then
    print "=================================="
    print "Installing packer and plugins."
    print "Wait until packer completes,"
    print "then restart vim."
    print "=================================="
    return false
else
    return true
end
