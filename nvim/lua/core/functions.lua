local function copy(string)
  vim.fn.setreg('*', string)
end

function CopyAbsoluteFilePath()
  copy(vim.fn.expand('%:p'))
end

function CopyProjectFilePath() local root_names = { '.git', 'Makefile' }
  local root_cache = {}
  local path = vim.fn.expand('%:p')

  if path == '' then return end
  path = vim.fs.dirname(path)

  local root = root_cache[path]
  if root == nil then
    local root_file = vim.fs.find(root_names, { path = path, upward = true })[1]
    if root_file == nil then return end
    root = vim.fs.dirname(root_file)
    root_cache[path] = root
  end
  copy(vim.fn.expand('%:p'):gsub((root .. "/"), ''))
end

function GitCurrentBranch()
  return vim.fn.system('git rev-parse --abbrev-ref HEAD'):gsub('\n', '')
end

function CopyCurrentBranchName()
  copy(GitCurrentBranch())
end

local function gitDefaultBranchName()
  return vim.fn.system("git remote show origin | sed -n '/HEAD branch/s/.*: //p'"):gsub('\n', '')
end

local function gitRepositoryName()
  return string.match(vim.fn.system("git remote get-url origin"), ':(.*).git.*'):gsub('\n', '')
end

local function createGitlabPullRequest()
  local current_branch = GitCurrentBranch()
  local default_branch = gitDefaultBranchName()
  local repository = gitRepositoryName()
  local url = string.format(
    "https://gitlab.com/%s/merge_requests/new?merge_request[source_branch]=%s&merge_request[target_branch]=%s",
    repository,
    current_branch,
    default_branch
  )
  local command = '!open "'.. url.. '"'
  vim.cmd(command)
end


local function createGithubPullRequest()
  local current_branch = GitCurrentBranch()
  local repository = gitRepositoryName()
  local url = string.format(
    "https://github.com/%s/compare/%s?expand=1",
    repository,
    current_branch
  )
  local command = '!open "'.. url.. '"'
  vim.cmd(command)
end

local function creatBitBucketPullRequest()
  local current_branch = GitCurrentBranch()
  local default_branch = gitDefaultBranchName()
  local repository = gitRepositoryName()
  local url = string.format(
    "https://bitbucket.org/%s/pull-request/new?source=%s::%s&dest=%s::%s",
    repository,
    repository,
    current_branch,
    repository,
    default_branch
  )
  local command = '!open "'.. url.. '"'
  vim.cmd(command)
end

function CreatePullRequest()
  local remote = vim.fn.system("git remote show origin")
  if string.find(remote, "gitlab") then createGitlabPullRequest() end
  if string.find(remote, "github") then createGithubPullRequest() end
  if string.find(remote, "bitbucket") then creatBitBucketPullRequest() end
end

NeoformatEnabled = false
local function enableNeoFormatOnSave()
  local group = vim.api.nvim_create_augroup("Neoformat", { clear = false })
  vim.api.nvim_create_autocmd({ "BufWritePre * undojoin" }, {
    pattern = { "*.go,*.js,*.ts,*.jsx,*.tsx,*.vue,*.scss,*.rb,*.json,*.ru,*.css" },
    command = "silent Neoformat",
    group = group
  })
  NeoformatEnabled = true
end
enableNeoFormatOnSave()

local function disableNeoFormatOnSave()
  vim.api.nvim_del_augroup_by_name("Neoformat")
  NeoformatEnabled = false
end

function ToggleNeoFormatOnSave()
  if NeoformatEnabled then
    disableNeoFormatOnSave()
  else
    enableNeoFormatOnSave()
  end
end

function IsQuickfixBuffer()
  local buftype = vim.fn.getbufvar(vim.fn.bufnr('%'), '&buftype')
  return buftype == 'quickfix'
end
