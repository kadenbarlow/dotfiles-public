return function()
    local lower_case = string.gsub(vim.fn.expand("<cword>"), "%a", string.lower)
    vim.cmd("normal ciw" .. lower_case)
end
