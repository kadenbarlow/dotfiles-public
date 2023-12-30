function IsQuickfixBuffer()
    local buftype = vim.fn.getbufvar(vim.fn.bufnr("%"), "&buftype")
    return buftype == "quickfix"
end

function DeleteQuickFixItemOrNormalLine()
    if IsQuickfixBuffer() then
        vim.api.nvim_input(":RemoveQFItem<CR>")
    else
        vim.fn.feedkeys("dd", "n")
    end
end

function QuickFixSearchTerm()
    vim.api.nvim_input(":vim // %<CR>")
    vim.api.nvim_input(":copen<CR>")
end
