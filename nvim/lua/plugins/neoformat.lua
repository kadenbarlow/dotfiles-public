vim.g.neoformat_vue_eslint = {
 exe = 'eslint_d',
 args = { '--stdin', '--stdin-filename', '"%:p"', '--fix-to-stdout'  },
 stdin = 1,
 try_node_exe = 1
}

vim.g.neoformat_enabled_go = { 'gofmt' }
vim.g.neoformat_enabled_javascript = {  'eslint_d' }
-- vim.g.neoformat_enabled_javascript = { 'prettier', 'eslint_d' }

vim.g.neoformat_enabled_vue = { 'eslint' } -- custom formatter from above
-- vim.g.neoformat_enabled_vue = { 'prettier', 'eslint' } -- custom formatter from above

vim.g.neoformat_enabled_html = { 'prettier' }
vim.g.neoformat_enabled_graphql = { 'prettier' }
vim.g.neoformat_enabled_json = { 'prettier', 'eslint_d' }
vim.g.neoformat_enabled_jsonc = { 'prettier', 'eslint_d' }
vim.g.neoformat_enabled_ruby = { 'rubocop' }
vim.g.neoformat_enabled_javascriptreact = { 'prettier' }

vim.g.neoformat_run_all_formatters = true
vim.g.neoformat_try_node_exe = true
vim.g.neoformat_verbose = false

