local function copy(string)
    vim.fn.setreg("*", string)
end

function CopyAbsoluteFilePath()
    copy(vim.fn.expand("%:p"))
end

function CopyProjectFilePath()
    copy(vim.fn.expand("%:~:."))
end

function CopyProjectFilePathAndLineNumber()
    copy(vim.fn.expand("%:~:.") .. ":" .. vim.fn.line(".") + 1)
end

function GitCurrentBranch()
    return vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", "")
end

function CopyCurrentBranchName()
    copy(GitCurrentBranch())
end

function GitFileHistory()
    local git_history = 'log --date=format:"%Y-%m-%d %H:%I:%S" '
    local git_history_format =
        '--pretty=format:"%h%C(reset)  %C(04)%ad%C(reset)  %C(green)%<(16,trunc)%an%C(reset)  %s%C(reset)" '
    local git_file = "-- " .. vim.fn.expand("%:p")
    local command = git_history .. git_history_format .. git_file
    -- print(command)
    vim.cmd.Git(command)
end
