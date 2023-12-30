local javascript_variable_log = 'console.log("%s %%s", JSON.stringify(%s))'

require("refactoring").setup(
    {
        print_var_statements = {
            javascript = {javascript_variable_log},
            typescript = {javascript_variable_log},
            javascriptreact = {javascript_variable_log},
            typescriptreact = {javascript_variable_log}
        }
    }
)
