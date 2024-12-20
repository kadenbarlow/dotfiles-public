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
        "ts_ls",
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

require("lspconfig").eslint.setup {
    on_init = function(client)
        local path = client.workspace_folders[1].name
        local f = io.open(path .. "/.kaden/eslint.global", "r")
        if f ~= nil then
            io.close(f)
            local bin = os.getenv("NVM_BIN")
            client.config.settings.nodePath = bin .. "/../lib/node_modules"
            client.notify("workspace/didChangeConfiguration", {settings = client.config.settings})
        end
        return true
    end,
    on_attach = function(client, bufnr)
        local path = client.workspace_folders[1].name
        local f = io.open(path .. "/.kaden/eslint.disableAutoFix", "r")
        if f ~= nil then
            io.close(f)
        else
            vim.api.nvim_create_autocmd(
                "BufWritePre",
                {
                    buffer = bufnr,
                    command = "EslintFixAll"
                }
            )
        end
    end
}

local group = vim.api.nvim_create_augroup("__env", {clear = true})
vim.api.nvim_create_autocmd(
    "BufEnter",
    {
        pattern = ".env",
        group = group,
        callback = function(args)
            vim.diagnostic.disable(args.buf)
        end
    }
)

-- local function organize_imports()
--     local params = {
--         command = "_typescript.organizeImports",
--         arguments = {vim.api.nvim_buf_get_name(0)},
--         title = ""
--     }
--     vim.lsp.buf.execute_command(params)
-- end

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- require("lspconfig").tsserver.setup {
--     on_attach = function(_, bufnr)
--         vim.api.nvim_create_autocmd(
--             "BufWritePre",
--             {
--                 group = augroup,
--                 buffer = bufnr,
--                 callback = function()
--                     vim.cmd("OrganizeImports")
--                 end
--             }
--         )
--     end,
--     commands = {
--         OrganizeImports = {
--             organize_imports,
--             description = "Organize Imports"
--         }
--     }
-- }
