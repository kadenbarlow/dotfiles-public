-- local cwd = vim.fn["getcwd"]()
-- local enableEslint = (not string.find(cwd, "projects/applause-"))
-- enableEslint and require("formatter.filetypes.javascript").eslint_d or nil

require("formatter").setup {
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        css = {require("formatter.filetypes.css").prettier},
        html = {require("formatter.filetypes.html").prettier},
        graphql = {require("formatter.filetypes.graphql").prettier},
        javascript = {require("formatter.filetypes.javascript").prettier},
        javascriptreact = {require("formatter.filetypes.javascriptreact").prettier},
        json = {require("formatter.filetypes.json").prettier},
        typescript = {require("formatter.filetypes.typescript").prettier},
        typescriptreact = {require("formatter.filetypes.typescriptreact").prettier},
        lua = {require("formatter.filetypes.lua").luafmt},
        ruby = {require("formatter.filetypes.ruby").rubocop},
        sh = {require("formatter.filetypes.sh").shfmt},
        vue = {require("formatter.filetypes.vue").prettier}
    }
}
