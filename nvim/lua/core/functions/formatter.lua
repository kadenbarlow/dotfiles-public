FormattingEnabled = false
local function enableFormattingOnSave()
    local group = vim.api.nvim_create_augroup("Formatting", {clear = false})
    vim.api.nvim_create_autocmd(
        {"BufWritePost"},
        {
            pattern = {"*.go,*.js,*.ts,*.jsx,*.tsx,*.vue,*.scss,*.rb,*.json,*.ru,*.css,*.lua,*.graphql,*.sh"},
            command = "silent FormatWrite",
            group = group
        }
    )
    FormattingEnabled = true
end
enableFormattingOnSave()

local function disableFormattingOnSave()
    vim.api.nvim_del_augroup_by_name("Formatting")
    FormattingEnabled = false
end

function ToggleFormattingOnSave()
    if FormattingEnabled then
        disableFormattingOnSave()
    else
        enableFormattingOnSave()
    end
end
