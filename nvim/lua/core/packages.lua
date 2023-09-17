-- Automatically install packer
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print 'Failure installing packer'
  return false
end

-- Install your plugins here
packer.startup(function(use)
  -- Plugins needed by all other plugins
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use 'nvim-lua/plenary.nvim' -- Useful lua functions used ny lots of plugins required by several other plugins listed

  -- Telescope and Navigation Related Plugins
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { 'nvim-lua/plenary.nvim' } }
  -- use 'nvim-telescope/telescope-project.nvim' -- project handling
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- better fuzzy searching than native telescope
  use 'nvim-telescope/telescope-live-grep-args.nvim' -- pass arguments into telescope for limiting file type or directory
  use({ -- used in <leader>sd and <leader>pd to have an interactive picker for searching a specific directory for text or file
    "princejoogie/dir-telescope.nvim",
    config = function()
      require("dir-telescope").setup({
        hidden = false,
        show_preview = false,
        -- no_ignore = false,
      })
    end
  })
  use 'desdic/agrolens.nvim'
  use 'ThePrimeagen/harpoon'
  use 'christoomey/vim-tmux-navigator'

  -- Plugins for modifying and changing text
  use 'tpope/vim-surround' -- change those quotes or braces
  use 'tpope/vim-commentary' -- comment lines of code
  use 'tpope/vim-fugitive' -- git functions in vim
  use 'tpope/vim-abolish' -- string inflection and project refactoring
  use 'tpope/vim-sleuth' -- autodetects indentation in a file
  use 'tpope/vim-scriptease' -- helpful functions for debugging vimscript and messages
  use({ -- treesj and splitjoin together provides gS and gJ commands for split and multi line coversions
    'Wansmer/treesj',
    requires = { 'nvim-treesitter' },
    config = function()
      local langs = require('treesj.langs')['presets']
      require('treesj').setup({
        use_default_keymaps = false,
        langs = langs,
        max_join_length = 1000 -- just a really large number so there are no restrictions
      })
      vim.api.nvim_create_autocmd({ 'FileType' }, {
        pattern = '*',
        callback = function()
          local opts = { buffer = true }
          if langs[vim.bo.filetype] then
            vim.keymap.set('n', 'gS', '<Cmd>TSJSplit<CR>', opts)
            vim.keymap.set('n', 'gJ', '<Cmd>TSJJoin<CR>', opts)
          else
            vim.keymap.set('n', 'gS', '<Cmd>SplitjoinSplit<CR>', opts)
            vim.keymap.set('n', 'gJ', '<Cmd>SplitjoinJoin<CR>', opts)
          end
        end,
      })
    end,
  })
  use 'AndrewRadev/splitjoin.vim'

  -- Plugins for autoclosing blocks and tags etc
  use 'RRethy/nvim-treesitter-endwise' -- add "end" automatically in languages that use it
  use 'windwp/nvim-ts-autotag' -- html tag autoclose and refactoring
  -- use 'AndrewRadev/tagalong.vim' -- nvim-ts-autotag wouldn't disable autoclosing tags so trying this plugin out
  use 'jiangmiao/auto-pairs' -- add closing braces and quotes automatically
  use 'andymass/vim-matchup' -- fix % operator to work in languages with weird syntax (like ruby...)
  use 'lukas-reineke/indent-blankline.nvim' -- add indentation guides to make it easier to spot pairs
  use 'maxmellon/vim-jsx-pretty' -- jsx indentation and highlighting

  use 'sbdchd/neoformat' -- autoformatting files

  -- Plugins for making the editor look nice
  use 'norcalli/nvim-colorizer.lua' -- highlight hex values in buffer with colors
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-tree/nvim-tree.lua' -- file sidebar
  use 'mbbill/undotree' -- visual undotree
  use 'folke/tokyonight.nvim'

  use 'kristijanhusak/vim-carbon-now-sh'

  -- LSP related plugins and configuration
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- syntax highlighting improvements
  use { 'nvim-treesitter/playground' } -- buffer ast parsing
  use { 'nvim-treesitter/nvim-treesitter-context' } -- keep current scope visible on page
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional

      -- Additional lua configuration, makes nvim stuff amazing
      {'folke/neodev.nvim'},
    }
  }

  use 'Exafunction/codeium.vim'

  if is_bootstrap then
    require('packer').sync()
  end
end)

if is_bootstrap then
  print '=================================='
  print 'Installing packer and plugins.'
  print 'Wait until packer completes,'
  print 'then restart vim.'
  print '=================================='
  return false
else
  return true
end
