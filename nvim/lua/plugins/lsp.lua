local get = require("lib.get")

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local default_setup = function(server)
    require("lspconfig")[server].setup({capabilities = lsp_capabilities})
end

vim.diagnostic.config({virtual_text = true})

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
                            if get(project_config, {"eslint", "use_global_node_module"}) then
                                local bin = os.getenv("NVM_BIN")
                                client.config.settings.nodePath = bin .. "/../lib/node_modules"
                                client.notify("workspace/didChangeConfiguration", {settings = client.config.settings})
                            end
                            return true
                        end,
                        on_attach = function(_, bufnr)
                            if not get(project_config, {"eslint", "disable_auto_fix"}) then
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
