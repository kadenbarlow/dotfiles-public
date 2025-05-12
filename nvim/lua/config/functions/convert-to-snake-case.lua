return function()
    local current_word = vim.fn.expand("<cword>")
    local snake_case =
        current_word:gsub("(%l)(%u)", "%1_%2"):gsub("(%d)(%u)", "%1_%2"):gsub("-", "_"):gsub("\\.", "_"):lower()
    vim.cmd("normal ciw" .. snake_case)
end
