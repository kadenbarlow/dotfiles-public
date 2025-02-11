return function()
    local enter = " 'C-m' ;"

    local runTestCommand = "'yarn test " .. vim.fn.expand("%:p") .. "'"
    local file = io.open(vim.fn.getcwd() .. "/.neovim/debug_test.command", "r")
    if file ~= nil then
        runTestCommand = string.format(file:read(), vim.fn.expand("%:p"))
        file:close()
    end

    vim.cmd(":silent !tmux split-window -h; tmux send-keys " .. runTestCommand .. enter)
end
