return function()
    local current_word = vim.fn.expand("<cword>")
    local kebab_case =
        current_word:gsub("(%l)(%u)", "%1-%2"):gsub("(%d)(%u)", "%1-%2"):gsub("_", "-"):gsub("\\.", "-"):lower()
    vim.cmd("normal ciw" .. kebab_case)
end
