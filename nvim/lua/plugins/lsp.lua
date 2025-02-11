local signs = {Error = " ", Warn = " ", Hint = " 󰠠", Info = " "}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local default_setup = function(server)
    require("lspconfig")[server].setup({capabilities = lsp_capabilities})
end

require("mason").setup({})
require("mason-lspconfig").setup(
    {
        ensure_installed = {
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
        },
        handlers = {
            default_setup,
            eslint = function()
                require("lspconfig").eslint.setup(
                    {
                        capabilities = lsp_capabilities,
                        on_init = function(client)
                            local path = client.workspace_folders[1].name
                            local f = io.open(path .. "/.neovim/eslint.global", "r")
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
                            local f = io.open(path .. "/.neovim/eslint.disable_auto_fix", "r")
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
                )
            end
        }
    }
)

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
