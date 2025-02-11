local formatting_enabled = false
local function enable_formatting_on_save()
    local group = vim.api.nvim_create_augroup("Formatting", {clear = false})
    vim.api.nvim_create_autocmd(
        {"BufWritePost"},
        {
            pattern = {
                "*.go,*.js,*.mjs,*.cjs,*.ts,*.jsx,*.tsx,*.vue,*.scss,*.rb,*.json,*.ru,*.css,*.lua,*.graphql,*.sh"
            },
            command = "silent FormatWrite",
            group = group
        }
    )
    FormattingEnabled = true
end
enable_formatting_on_save()

local function disable_formatting_on_save()
    vim.api.nvim_del_augroup_by_name("Formatting")
    formatting_enabled = false
end

return function()
    if formatting_enabled then
        disable_formatting_on_save()
    else
        enable_formatting_on_save()
    end
end
