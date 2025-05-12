return function()
    local new_word = string.gsub(vim.fn.expand("<cword>"), "%a", string.upper)
    vim.cmd("normal ciw" .. new_word)
end
