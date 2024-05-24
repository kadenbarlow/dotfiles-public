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

local function gitDefaultBranchName()
    return vim.fn.system("git remote show origin | sed -n '/HEAD branch/s/.*: //p'"):gsub("\n", "")
end

local function gitRepositoryName()
    return string.match(vim.fn.system("git remote get-url origin"), ":(.*).git.*"):gsub("\n", "")
end

local function createGitlabPullRequest()
    local current_branch = GitCurrentBranch()
    local default_branch = gitDefaultBranchName()
    local repository = gitRepositoryName()
    local url =
        string.format(
        "https://gitlab.com/%s/merge_requests/new?merge_request[source_branch]=%s&merge_request[target_branch]=%s",
        repository,
        current_branch,
        default_branch
    )
    local command = '!open "' .. url .. '"'
    vim.cmd(command)
end

local function createGithubPullRequest()
    local current_branch = GitCurrentBranch()
    local repository = gitRepositoryName()
    local url = string.format("https://github.com/%s/compare/%s?expand=1", repository, current_branch)
    local command = '!open "' .. url .. '"'
    vim.cmd(command)
end

local function creatBitBucketPullRequest()
    local current_branch = GitCurrentBranch()
    local default_branch = gitDefaultBranchName()
    local repository = gitRepositoryName()
    local url =
        string.format(
        "https://bitbucket.org/%s/pull-request/new?source=%s::%s&dest=%s::%s",
        repository,
        repository,
        current_branch,
        repository,
        default_branch
    )
    local command = '!open "' .. url .. '"'
    vim.cmd(command)
end

function CreatePullRequest()
    local remote = vim.fn.system("git remote show origin")
    if string.find(remote, "gitlab") then
        createGitlabPullRequest()
    end
    if string.find(remote, "github") then
        createGithubPullRequest()
    end
    if string.find(remote, "bitbucket") then
        creatBitBucketPullRequest()
    end
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
