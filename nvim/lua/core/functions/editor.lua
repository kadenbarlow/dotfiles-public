function WindowSplitVertically()
    vim.cmd.vsp(vim.fn.expand("%:p"))
    vim.api.nvim_input("<C-w>l")
    vim.api.nvim_input("<SPACE>ws")
end

function WindowSplitHorizontally()
    vim.cmd.sp(vim.fn.expand("%:p"))
    vim.api.nvim_input("<C-w>j")
    vim.api.nvim_input("<SPACE>ws")
end

function OpenTerminal()
    vim.cmd.sp(vim.fn.expand("%:p"))
    vim.api.nvim_input("<C-w>j:terminal<CR>:setlocal nonumber norelativenumber<CR>i")
end

function ToggleLineWrap()
    vim.cmd("set wrap! linebreak!")
end

function MoveToNextSnippetOption()
    require("luasnip").jump(1)
end

SearchAndReplaceSearchTerm = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
