local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed(
    {
        "bashls",
        "cssls",
        "dockerls",
        "emmet_language_server",
        "eslint",
        "jedi_language_server",
        "jsonls",
        "lua_ls",
        "solargraph",
        "tsserver",
        "yamlls"
    }
)

lsp.set_preferences(
    {
        sign_icons = {}
    }
)

lsp.configure(
    "yamlls",
    {
        settings = {
            yaml = {
                keyOrdering = false,
                editor = {
                    formatOnType = true
                }
            }
        }
    }
)

lsp.on_attach(
    function(_, bufnr)
        vim.keymap.set(
            "n",
            "gd",
            function()
                vim.lsp.buf.definition()
            end,
            {buffer = bufnr, remap = false, desc = "[G]o to [D]efinition"}
        )
        vim.keymap.set(
            "n",
            "gD",
            function()
                vim.lsp.buf.declaration()
            end,
            {buffer = bufnr, remap = false, desc = "[G]o to [D]eclaration"}
        )
        vim.keymap.set(
            "n",
            "gi",
            function()
                vim.lsp.buf.implementation()
            end,
            {buffer = bufnr, remap = false, desc = "[G]o to [I]mplementation"}
        )
        vim.keymap.set(
            "n",
            "gt",
            function()
                vim.lsp.buf.type_definition()
            end,
            {buffer = bufnr, remap = false, desc = "[G]o to [T]ype [D]efinition"}
        )
        vim.keymap.set(
            "n",
            "K",
            function()
                vim.lsp.buf.hover()
            end,
            {buffer = bufnr, remap = false, desc = "LSP Show Hover"}
        )
        vim.keymap.set(
            "n",
            "H",
            function()
                vim.lsp.buf.signature_help()
            end,
            {buffer = bufnr, remap = false, desc = "LSP signature [H]elp"}
        )
        vim.keymap.set(
            "n",
            "grr",
            function()
                vim.lsp.buf.references()
            end,
            {buffer = bufnr, remap = false, desc = "LSP [G]o to [R]efe[R]ences in quickfix list"}
        )
        vim.keymap.set(
            "n",
            "grn",
            function()
                vim.lsp.buf.rename()
            end,
            {buffer = bufnr, remap = false, desc = "LSP refactor/[R]e[N]ame"}
        )
        vim.keymap.set(
            "n",
            "ga",
            function()
                vim.lsp.buf.code_action()
            end,
            {buffer = bufnr, remap = false, desc = "LSP [G]o to code [A]ction"}
        )
        vim.keymap.set(
            "n",
            "ge",
            function()
                vim.diagnostic.open_float()
            end,
            {buffer = bufnr, remap = false, desc = "LSP [G]o to [E]rror/open float"}
        )
        vim.keymap.set(
            "n",
            "[d",
            function()
                vim.diagnostic.goto_next()
            end,
            {buffer = bufnr, remap = false, desc = "move to [[]next [D]iagnostic"}
        )
        vim.keymap.set(
            "n",
            "]d",
            function()
                vim.diagnostic.goto_prev()
            end,
            {buffer = bufnr, remap = false, desc = "move to []]previous [D]iagnostic"}
        )
    end
)

require("neodev").setup()
lsp.setup()

require("luasnip.loaders.from_vscode").lazy_load({paths = "~/.dotfiles/nvim/snippets"})
require "luasnip".filetype_extend("ruby", {"rails"})
require "luasnip".filetype_extend("vue", {"vue"})

vim.diagnostic.config(
    {
        virtual_text = true
    }
)

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = {Error = " ", Warn = " ", Hint = " 󰠠", Info = " "}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end

local cmp = require("cmp")
local action = require("lsp-zero").cmp_action()
cmp.setup(
    {
        mapping = {
            ["<C-l>"] = action.luasnip_jump_forward(),
            ["<C-h>"] = action.luasnip_jump_backward()
        }
    }
)
