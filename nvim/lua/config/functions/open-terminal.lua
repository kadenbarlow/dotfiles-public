return function()
    vim.cmd.sp(vim.fn.expand("%:p"))
    vim.api.nvim_input("<C-w>j:terminal<CR>:setlocal nonumber norelativenumber<CR>i")
end
