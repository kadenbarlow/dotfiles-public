return function(folder)
    vim.cmd(":w")
    local word = vim.fn.expand("<cword>")
    vim.cmd(":!~/.dotfiles/nvim/scripts/create-function.mjs %:p:h " .. folder .. " " .. word)
    vim.cmd(":e")
    vim.cmd(":FormatWrite")
end
