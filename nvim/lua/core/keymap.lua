require("core/functions")
local telescope = require("telescope.builtin")
local harpoonMark = require("harpoon.mark")
local harpoonUi = require("harpoon.ui")

vim.g.mapleader = " "
local map = function(mode, keys, func, desc, expr, silent)
    if not expr then
        expr = false
    end
    if silent == nil then
        silent = true
    end
    vim.keymap.set(mode, keys, func, {desc = desc, silent = silent, expr = expr})
end

map("n", "<leader>qq", ":qa<CR>", "[Q]uit All")

map("n", "<leader>wh", "<C-w>h", "[W]indow [h] move one window to the left")
map("n", "<leader>wj", "<C-w>j", "[W]indow [j] move one window down or below")
map("n", "<leader>wk", "<C-w>k", "[W]indow [k] move one window up or above")
map("n", "<leader>wl", "<C-w>l", "[W]indow [l] move one window to the right")
map("n", "<leader>ws", "<C-w>x", "[W]indow [S]wap")
map("n", "<leader>wu", "<C-^>", "[W]indow [U]ndo jump")
map("v", "<leader>wn", ":NR<CR>", "Create new [W]indow [Narrowed] to the selected text")
map("n", "<leader>w=", "<C-w>=", "Resize [W]indows [=] equally")
map("n", "<leader>w,", "25<C-w><", "Resize [W]indows [,/<] smaller")
map("n", "<leader>w.", "25<C-w>>", "Resize [W]indows [./>] larger")
map("n", "<leader>w/", WindowSplitVertically, "[W]indow split [/]vertically")
map("n", "<leader>w-", WindowSplitHorizontally, "[W]indow split [-]horizontally ")

map("n", "<leader>tn", ":TSContextToggle<CR>", "[T]oggle [N]ested treesitter context")
map("n", "<leader>tu", vim.cmd.UndotreeToggle, "[T]oggle [U]ndotree")
map("n", "<leader>th", vim.cmd.NvimTreeToggle, "[T]oggle filetree [H]ide")
map("n", "<leader>to", OpenFileTree, "[T]oggle filetree [O]pen")
map("n", "<leader>tw", ToggleLineWrap, "[T]oggle line [W]rap")
map("n", "<leader>tf", ToggleFormattingOnSave, "[T]oggle automatic [F]ormatting on save")
map("n", "<leader>tc", ToggleCodeium, "[T]oggle [C]odeium")
map("n", "<leader>tt", ":Trouble<CR>", "[T]oggle [T]rouble aka Show file lsp diagnostics")
map("n", "<leader>trf", ":CloakToggle<CR>", "Cloak - [T]oggle [R]edactions on [F]ile")
map("n", "<leader>trl", ":CloakPreviewLine<CR>", "Cloak - [T]oggle [R]edactions on [L]ine")

map("n", "<leader>pd", ":Telescope dir find_files<CR>", "search files in a [P]roject [D]irectory")
map("n", "<leader>pf", SearchProjectFiles, "search through [P]roject [F]iles")

map("n", "<leader>bm", ":Messages<CR>", "display [B]uffer [M]essages")
map("n", "<leader>bN", ":enew<CR>", "[B]uffer [N]ew")
map("n", "<leader>bd", ":bp<bar>sp<bar>bn<bar>bd<CR>", "[B]uffer [D]elete current")
map("n", "<leader>bb", SearchBuffers, "search through [B]uffers")
map("n", "<leader>db", ":windo diffthis<CR>", "[D]iff [B]uffers")

map("n", "<leader>sd", ":Telescope dir live_grep<CR>", "[S]earch file contents in a specific [D]irectory")
map("n", "<leader>sk", telescope.keymaps, "[S]earch [K]eymaps/commands")
map("n", "<leader>sh", telescope.help_tags, "[S]earch [H]elp tags")
map("n", "<leader>sr", SearchAndReplaceSearchTerm, "[S]earch and [R]eplace file for current word", nil, false)
map("n", "<leader>sp", SearchProjectFileContents, "[S]earch file contents in [P]roject")
map("n", "<leader>s,", SearchForHtmlUsagesInProject, "[S]earch for HTML[<] tag uses in project")
map("n", "<leader>sq", QuickFixSearchTerm, "[S]earch file for last term and add to [Q]uickfix list")
map("n", "<leader>sl", SearchQuickfixList, "[S]earch quickfix [L]ist")
map("n", "<leader>sa", ":Telescope resume<CR>", "[S]earch [A]gain or telescope resume")
map("n", "<leader>/", ":noh<CR>", "clear [/]highlight from most recent search")

map("n", "<leader>fx", "<cmd>!chmod +x %<CR>", "[F]ile permissions - make e[X]ecutable")
map("n", "<leader>fj", ":%!jq .<CR>", "[F]ile format [J]son using jq")
map("n", "<leader>ff", FindFiles, "[F]ind [F]iles")
map("n", "<leader>fr", FindRecentFiles, "[F]ind [R]ecently opened files")
map("n", "<leader>fp", FindDotfile, "[Find] file in dotfiles [P]roject")
map("n", "<leader>fe", ":EslintFixAll<CR>", "[F]ile format/fix with [E]slint")
map("n", "<leader>ef", "<CMD>Oil<CR>", "[E]dit [F]iletree in buffer with Oil")

map("n", "<leader>cfp", CopyAbsoluteFilePath, "[C]opy absolute [F]ile [P]ath")
map("n", "<leader>cpp", CopyProjectFilePath, "[C]opy [P]roject relative file [P]ath")
map("n", "<leader>cgb", CopyCurrentBranchName, "[C]opy current [G]it [B]ranch name")
map("n", "<leader>cln", CopyProjectFilePathAndLineNumber, "[C]opy current file path and [L]ine [N]umber")

map("n", "<leader>vr", vim.cmd.so, "[V]im source/[R]eload file")
map("n", "<leader>vc", vim.cmd.PackerCompile, "[V]im packer [C]ompile")
map("n", "<leader>vi", vim.cmd.PackerInstall, "[V]im packer [I]nstall plugins")
map("n", "<leader>vu", vim.cmd.PackerUpdate, "[V]im packer [U]pdate plugins")
map("n", "<leader>vs", vim.cmd.PackerSync, "[V]im packer [S]ync (install and update) plugins")
map("n", "<leader>vt", vim.cmd.PackerStatus, "[V]im packer [S]tatus")

map("n", "<leader>gs", vim.cmd.Git, "[G]it [S]tatus")
map("n", "<leader>gh", GitFileHistory, "[G]it file [H]istory")
map("n", "<leader>gt", ":0Gclog<CR>", "[G]it [T]imemachine with quickfix list")
map("n", "<leader>gb", ":Git blame<CR>", "[G]it [B]lame")

map("n", "<leader>dp", DebugPrint, "[D]ebug - [P]rint")
map({"x", "n"}, "<leader>dv", DebugPrintVariable, "[D]ebug - print [V]ariable")
map("n", "<leader>dd", DeleteDebugStatements, "[D]ebug - [D]elete statements")
map("n", "<leader>di", "Odebugger<ESC>:w<CR>", "[D]ebug - [I]nsert debugger")
map("n", "<leader>df", DebugFunction, "[D]ebug - run [F]unction")
map("n", "<leader>dt", DebugTest, "[D]ebug - run [T]est")
map("n", "<leader>gi", ":!~/.dotfiles/applause/scripts/create-index.mjs %:p:h<CR>", "[G]enerate JS [I]ndex File")

map("n", "<leader>rw", ":%s/\\s\\+$//e<CR>", "[R]emove [W]hitespace")
map("x", "<leader>ref", ":Refactor extract ", "[Re]factor - [E]xtract current selection to [F]unction", nil, false)
map("x", "<leader>reF", ":Refactor extract_to_file ", "[Re]factor - [E]xtract function to [F]ile", nil, false)
map("x", "<leader>rev", ":Refactor extract_var ", "[Re]factor - [E]xtract current selection to [V]ariable", nil, false)
map({"n", "x"}, "<leader>riv", ":Refactor inline_var", "[Re]factor - [I]nline [V]ariable", nil, false)
map("n", "<leader>rif", ":Refactor inline_func", "[Re]factor - [I]nline [F]unction", nil, false)
map("n", "<leader>rbf", ":Refactor extract_block", "[Re]factor - [E]xtract [B]lock to to [F]unction", nil, false)
map("n", "<leader>rbF", ":Refactor extract_block_to_file", "[Re]factor - [E]xtract [B]lock to [F]ile", nil, false)

map("n", "<leader>ha", harpoonMark.add_file, "[H]arpoon - [A]dd file")
map("n", "<leader>hf", harpoonUi.toggle_quick_menu, "[H]arpoon - list [F]iles")
map("n", "<leader>h1", ":lua require('harpoon.ui').nav_file(1)<CR>", "[H]arpoon - [1]st file")
map("n", "<leader>h2", ":lua require('harpoon.ui').nav_file(2)<CR>", "[H]arpoon - [2]nd file")
map("n", "<leader>h3", ":lua require('harpoon.ui').nav_file(3)<CR>", "[H]arpoon - [3]rd file")
map("n", "<leader>h4", ":lua require('harpoon.ui').nav_file(4)<CR>", "[H]arpoon - [4]th file")

map("n", "<leader>ot", OpenTerminal, "[O]pen [T]erminal")

map("n", "mm", ":BookmarkAnnotate<CR>", "[M]ark Book[M]ark")
map("n", "md", ":BookmarkClear<CR>", "[M]ark [D]elete")

map("v", "J", ":m '>+1<CR>gv=gv", "move selected lines down [J]")
map("v", "K", ":m '<-2<CR>gv=gv", "move selected lines up [K]")
map("n", "J", "mzJ`z", "move the line below [J] up to the end of current line")
map("n", "<M-down>", "<C-d>")
map("n", "<M-up>", "<C-u>")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "f", ":HopChar1<CR>")
map("n", "*", "yiw*")
map("n", "dd", DeleteQuickFixItemOrNormalLine)

map("i", "<C-t>", "(╯°□°)╯︵ ┻━┻", "insert [T]ableflip")
map("i", "<C-s>", "¯\\_(ツ)_/¯", "insert [S]hrug")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-n>", ":cn<CR>", "move to [N]ext option in quickfix list")
map("n", "<C-p>", ":cp<CR>", "move to [P]revious option in quickfix list")

map("i", "<C-j>", CodeiumAccept, "codeium accept suggestion [j]", true)
-- map("i", "<C-l>", CodeiumCycleCompletionsForward, "codeium cycle completions forward [l]", true)
-- map("i", "<C-h>", CodeiumCycleCompletionsBackward, "codeium cycle completions backward [h]", true)
map("i", "<C-x>", CodeiumClear, "codeium clear suggestions [x]", true)
map("t", "<C-b>", "<C-\\><C-n>", "return [B]ack to vim from terminal")
