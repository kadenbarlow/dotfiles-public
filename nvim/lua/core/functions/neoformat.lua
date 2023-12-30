NeoformatEnabled = false
local function enableNeoFormatOnSave()
    local group = vim.api.nvim_create_augroup("Neoformat", {clear = false})
    vim.api.nvim_create_autocmd(
        {"BufWritePre * undojoin"},
        {
            pattern = {"*.go,*.js,*.ts,*.jsx,*.tsx,*.vue,*.scss,*.rb,*.json,*.ru,*.css,*.lua"},
            command = "silent Neoformat",
            group = group
        }
    )
    NeoformatEnabled = true
end
enableNeoFormatOnSave()

local function disableNeoFormatOnSave()
    vim.api.nvim_del_augroup_by_name("Neoformat")
    NeoformatEnabled = false
end

function ToggleNeoFormatOnSave()
    if NeoformatEnabled then
        disableNeoFormatOnSave()
    else
        enableNeoFormatOnSave()
    end
end
