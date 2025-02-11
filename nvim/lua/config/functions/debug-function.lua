return function()
    local enter = " 'C-m' ;"

    local path = vim.fn.expand("%:p")
    local file = io.open(vim.fn.getcwd() .. "/.neovim/debug_function.path_function", "r")
    if file ~= nil then
        local fn = load(string.format(file:read("*all"), path))
        if fn ~= nil then
            path = fn()
        end
    end

    local import_command = '{ default: fn } = await import("' .. path .. '")'
    file = io.open(vim.fn.getcwd() .. "/.neovim/debug_function.import_command", "r")
    if file ~= nil then
        import_command = string.format(file:read(), vim.fn.expand("%:p"))
        file:close()
    end

    local start_repl_command = "yarn repl"
    file = io.open(vim.fn.getcwd() .. "/.neovim/debug_function.repl_command", "r")
    if file ~= nil then
        start_repl_command = string.format(file:read(), vim.fn.expand("%:p"))
        file:close()
    end

    vim.cmd(
        ":silent !tmux split-window -h; tmux send-keys " ..
            "'" .. start_repl_command .. "'" .. enter .. "tmux send-keys " .. "'" .. import_command .. "'" .. enter
    )
end
