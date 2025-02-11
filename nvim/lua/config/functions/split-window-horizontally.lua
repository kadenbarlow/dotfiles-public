return function()
    vim.cmd.sp(vim.fn.expand("%:p"))
    vim.api.nvim_input("<C-w>j")
    vim.api.nvim_input("<SPACE>ws")
end
