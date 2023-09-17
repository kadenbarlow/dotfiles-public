require('core/functions')

vim.g.mapleader = ' ' -- set leader key to space
vim.keymap.set('n', '<leader>qq', ':qa<CR>', { desc = '[Q]uit and confirm [Quit] all the things' }) -- quit all and exit

-- use <leader>w + hjkl to move between windows
vim.keymap.set('n', '<leader>wh', ':<C-U>TmuxNavigateLeft<CR>', { desc = '[W]indow [h] move one window to the left' })
vim.keymap.set('n', '<leader>wj', ':<C-U>TmuxNavigateDown<CR>', { desc = '[W]indow [j] move one window down or below' })
vim.keymap.set('n', '<leader>wk', ':<C-U>TmuxNavigateUp<CR>', { desc = '[W]indow [k] move one window up or above' })
vim.keymap.set('n', '<leader>wl', ':<C-U>TmuxNavigateRight<CR>', { desc = '[W]indow [l] move one window to the right' })
vim.keymap.set('n', '<leader>ws', '<C-w>x', { desc = '[W]indow [S]wap' })
vim.keymap.set('n', '<leader>w/', function()
  vim.cmd.vsp(vim.fn.expand("%:p"))
  vim.api.nvim_input('<C-w>l')
  vim.api.nvim_input('<SPACE>ws')
end, { desc = '[W]indow split [/]vertically' })

vim.keymap.set('n', '<leader>w-', function()
  vim.cmd.sp(vim.fn.expand("%:p"))
  vim.api.nvim_input('<C-w>j')
  vim.api.nvim_input('<SPACE>ws')
end, { desc = '[W]indow split [-]horizontally ' })

vim.keymap.set('n', '<M-e>', vim.cmd.Ex, { desc = '[E]xplore files' }) -- stands for explore gets back out to file structure
vim.keymap.set('n', '<M-o>', function()
  vim.cmd.NvimTreeFindFile()
  vim.cmd.NvimTreeFocus()
end, { desc = '[O]pen file tree' })
vim.keymap.set('n', '<M-O>', vim.cmd.NvimTreeToggle, { desc = '[O]pen or close file tree' })

vim.keymap.set('n', '<leader>tw', function() vim.cmd('set wrap! linebreak!') end, { desc = '[T]oggle line [W]rap' })

local telescope = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>pp', function() vim.cmd.Telescope('project') end, { desc = '[S]earch projects' }) -- open project
vim.keymap.set('n', '<leader>pf', function() telescope.git_files({ show_untracked = true, previewer = false }) end, { desc = 'search through [P]roject [F]iles' }) -- search project file file
vim.keymap.set("n", "<leader>pd", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true, desc = 'search files in a [P]roject [D]irectory' })

vim.keymap.set('n', '<leader>bb', function() telescope.buffers({ previewer = false }) end, { desc = 'search through [B]uffers' })
vim.keymap.set('n', '<leader>bm', ':Messages<CR>', { desc = 'display [B]uffer [M]essages' })

vim.keymap.set('n', '<leader>ff', function() telescope.find_files({ previewer = false }) end, { desc = '[F]ind [F]iles' }) -- open any file
vim.keymap.set('n', '<leader>fr', function() telescope.oldfiles({ previewer = false }) end, { desc = '[F]ind [R]ecently opened files' })
vim.keymap.set('n', '<leader>fp', function() telescope.git_files({ cwd = '~/.dotfiles', show_untracked = true, previewer = false }) end, { desc = '[F]ind file in dotfiles [P]roject' }) -- open dotfiles

vim.keymap.set('n', '<leader>sp', function() require('telescope').extensions.live_grep_args.live_grep_args() end, { desc = '[S]earch file contents in [P]roject' }) -- grep through project
vim.keymap.set("n", "<leader>sd", "<cmd>Telescope dir live_grep<CR>", {
  noremap = true,
  silent = true,
  desc = '[S]earch through file contents limited to a specific [D]irectory',
})
vim.keymap.set('n', '<leader>sr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[S]earch and [R]eplace file for current word' }) -- search word in file to replace, *<leader>sw change word
vim.keymap.set('n', '<leader>sk', telescope.keymaps, { desc = '[S]earch [K]eymaps/commands' })
vim.keymap.set('n', '<leader>sq', function()
  vim.api.nvim_input(':vim // %<CR>')
  vim.api.nvim_input(':copen<CR>')
end, { desc = '[S]earch file for last term and add to [Q]uickfix list' })

vim.keymap.set('n', '<leader>sm', ':Telescope agrolens query=functions<CR>', { desc = '[S]earch [M]ethods/functions' })

vim.keymap.set('n', '<leader>/', ':noh<CR>', { desc = 'clear [/]highlight from most recent search' })

vim.keymap.set('n', '<leader>cfp', CopyAbsoluteFilePath, { desc = '[C]opy absolute [F]ile [P]ath' })
vim.keymap.set('n', '<leader>cpp', CopyProjectFilePath, { desc = '[C]opy [P]roject relative file [P]ath' })
vim.keymap.set('n', '<leader>cgb', CopyCurrentBranchName, { desc = '[C]opy current [G]it [B]ranch name' })

vim.keymap.set('n', '<leader>sh', telescope.help_tags, { desc = '[S]earch [H]elp tags' })

vim.keymap.set('n', '<leader>vr', vim.cmd.so, { desc = '[V]im source/[R]eload file' }) -- source this file at point
vim.keymap.set('n', '<leader>vc', vim.cmd.PackerCompile, { desc = '[V]im packer [C]ompile' })
vim.keymap.set('n', '<leader>vi', vim.cmd.PackerInstall, { desc = '[V]im packer [I]nstall plugins' })
vim.keymap.set('n', '<leader>vu', vim.cmd.PackerUpdate, { desc = '[V]im packer [U]pdate plugins' })
vim.keymap.set('n', '<leader>vs', vim.cmd.PackerSync, { desc = '[V]im packer [S]ync (install and update) plugins' })
vim.keymap.set('n', '<leader>vt', vim.cmd.PackerStatus, { desc = '[V]im packer [S]tatus' })

vim.keymap.set('n', '<leader>tu', vim.cmd.UndotreeToggle, { desc = '[T]oggle [U]ndotree' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'move selected lines down [J]' }) -- move highlighted lines up and down with smart indentation
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'move selected lines up [K]' })

vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'move the line below [J] up to the end of current line' }) -- collapse lines below into a single line
-- The following four remaps are for keeping the cursor in the middle of the buffer when scrolling or searching
vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('n', '<C-u>', "<C-u>zz")
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('x', '<leader>p', [['_dP]]) -- copy into the null register when you are going to override many things

vim.keymap.set('n', '<leader>fx', '<cmd>!chmod +x %<CR>', { silent = true, desc = '[F]ile permissions - make e[X]ecutable' })
vim.keymap.set('n', '<leader>fj', ':%!jq .<CR>', { desc = '[F]ile format [J]son using jq' })
vim.keymap.set('v', '<leader>fc', ':CarbonNowSh<CR>', { desc = '[F]ile open the selected lines in [C]arbonNowSh' })

vim.keymap.set('n', '<leader>ot', function()
  vim.cmd.sp(vim.fn.expand("%:p"))
  vim.api.nvim_input('<C-w>j:terminal<CR>:setlocal nonumber norelativenumber<CR>i')
end, { desc = '[O]pen [T]erminal' })

vim.keymap.set('n', '<leader>wu', '<C-^>', { desc = '[W]indow [U]ndo jump' })
vim.keymap.set('n', '<leader>bN', ':enew<CR>', { desc = '[B]uffer [N]ew' })
vim.keymap.set('n', '<leader>bd', ':bp<bar>sp<bar>bn<bar>bd<CR>', { desc = '[B]uffer [D]elete current' })

vim.keymap.set('i', '<M-j>', function () return vim.fn['codeium#Accept']() end, { expr = true, desc = 'codeium accept suggestion [j]' })
vim.keymap.set('i', '<M-l>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, desc = 'codeium cycle completions forward [l]' })
vim.keymap.set('i', '<M-h>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, desc = 'codeium cycle completions backward [h]' })
vim.keymap.set('i', '<M-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, desc = 'codeium clear suggestions [x]' })
vim.keymap.set('n', '<leader>tc', function() vim.g.codeium_enabled = not vim.g.codeium_enabled end, { desc = '[T]oggle [C]odeium' })
vim.keymap.set('n', '<leader>tf', ToggleNeoFormatOnSave, { desc = '[T]oggle automatic [F]ormatting on save' })

vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = '[G]it [S]tatus' })
vim.keymap.set('n', '<leader>gh', function()
  local git_history = 'log --date=format:"%Y-%m-%d %H:%I:%S" '
  local git_history_format = '--pretty=format:"%h%C(reset)  %C(04)%ad%C(reset)  %C(green)%<(16,trunc)%an%C(reset)  %s%C(reset)" '
  local git_file = "-- " .. vim.fn.expand('%:p')
  local command = git_history .. git_history_format .. git_file
  -- print(command)
  vim.cmd.Git(command)
end, { desc = '[G]it file [H]istory' })
vim.keymap.set('n', '<leader>gt', ':0Gclog<CR>', { desc = '[G]it [T]imemachine with quickfix list' })
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', { desc = '[G]it [B]lame' })
vim.keymap.set('n', '<leader>gp', CreatePullRequest, { desc = '[G]it create [P]ull request' })
vim.keymap.set('n', '<leader>od', ':execute "silent !open -a \'Google Chrome\' -u $(chrome-remote-interface list -p 9229 | jq -r \'.[0].devtoolsFrontendUrl\')"<CR>', { desc = '[O]n to [D]ebugger', silent = true })

vim.keymap.set('n', '<C-n>', ':cn<CR>', { desc = 'move to [N]ext option in quickfix list' })
vim.keymap.set('n', '<C-p>', ':cp<CR>', { desc = 'move to [P]revious option in quickfix list' })

vim.keymap.set('i', '<C-l>', function() require('luasnip').jump(1) end, { desc = 'move to next[l] option in snippet' })

vim.keymap.set('i', '<C-t>', '(╯°□°)╯︵ ┻━┻', { desc = 'insert [T]ableflip' })
vim.keymap.set('i', '<C-s>', '¯\\_(ツ)_/¯', { desc = 'insert [S]hrug' })

vim.keymap.set('v', '.', ':normal .<CR>')

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = '[H]arpoon [A]dd file' })
vim.keymap.set("n", "<leader>hf", ui.toggle_quick_menu, { desc = '[H]arpoon [F]iles' })

vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end, { desc = '[H]arpoon file [1]' })
vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end, { desc = '[H]arpoon file [2]' })
vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end, { desc = '[H]arpoon file [3]' })
vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end, { desc = '[H]arpoon file [4]' })

vim.keymap.set("n", "*", "yiw*")
vim.keymap.set("n", "<leader>rw", ":%s/\\s\\+$//e<CR>", { desc = '[R]emove [W]hitespace' })

vim.keymap.set("n", "dd", function()
  if IsQuickfixBuffer() then
    vim.api.nvim_input(':RemoveQFItem<CR>')
  else
    vim.fn.feedkeys('dd', 'n')
  end
end)
