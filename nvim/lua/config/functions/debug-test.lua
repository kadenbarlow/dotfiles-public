local get = require("lib.get")

return function()
    local enter = " 'C-m' ;"

    local default_run_test_command = "'yarn test " .. vim.fn.expand("%:p") .. "'"
    local run_test_command = get(project_config, {"debug_test", "command"}, default_run_test_command)

    vim.cmd(":silent !tmux split-window -h; tmux send-keys " .. run_test_command .. enter)
end
