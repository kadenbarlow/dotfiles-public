return function()
    vim.cmd.vsp(vim.fn.expand("%:p"))
    vim.api.nvim_input("<C-w>l")
    vim.api.nvim_input("<SPACE>ws")
end
