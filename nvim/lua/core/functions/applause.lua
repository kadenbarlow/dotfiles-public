function DebugFunction()
    local importStatement = '\'{ default: fn } = await import("' .. vim.fn.expand("%:p") .. '")\''
    local startReplCommand = "'yarn repl'"
    local enter = " 'C-m' ;"
    vim.cmd(
        ":silent !tmux split-window -h; tmux send-keys " ..
            startReplCommand .. enter .. "tmux send-keys " .. importStatement .. enter
    )
end

function DebugTest()
    local runTestCommand = "'yarn test " .. vim.fn.expand("%:p") .. "'"
    local enter = " 'C-m' ;"
    vim.cmd(":silent !tmux split-window -h; tmux send-keys " .. runTestCommand .. enter)
end
