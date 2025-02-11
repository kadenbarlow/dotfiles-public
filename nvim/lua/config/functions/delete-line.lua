local function is_quickfix_buffer()
    local buftype = vim.fn.getbufvar(vim.fn.bufnr("%"), "&buftype")
    return buftype == "quickfix"
end

return function()
    if is_quickfix_buffer() then
        vim.api.nvim_input(":RemoveQFItem<CR>")
    else
        vim.fn.feedkeys("dd", "n")
    end
end
