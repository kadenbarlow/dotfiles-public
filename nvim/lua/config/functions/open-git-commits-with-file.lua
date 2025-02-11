return function()
    local git_history = 'log --date=format:"%Y-%m-%d %H:%I:%S" '
    local git_history_format =
        '--pretty=format:"%h%C(reset)  %C(04)%ad%C(reset)  %C(green)%<(16,trunc)%an%C(reset)  %s%C(reset)" '
    local git_file = "-- " .. vim.fn.expand("%:p")
    local command = git_history .. git_history_format .. git_file
    vim.cmd.Git(command)
end
