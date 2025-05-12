local functions = require("config.functions")
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
local telescope = require("telescope.builtin")

local map = function(mode, keys, func, desc, expr, silent, remap)
    if not expr then
        expr = false
    end
    if silent == nil then
        silent = true
    end
    if remap == nil then
        remap = false
    end
    vim.keymap.set(mode, keys, func, {desc = desc, silent = silent, expr = expr, remap = remap})
end

map("n", "<leader>qq", ":qa<CR>", "[Q]uit All")
map("n", "<leader>q!", ":qa!<CR>", "[Q]uit All")

map("n", "<leader>wh", "<C-w>h", "[W]indow [h] move one window to the left")
map("n", "<leader>w,", "<C-w>H", "[W]indow [<] move the window to far right")
map("n", "<leader>wj", "<C-w>j", "[W]indow [j] move one window down or below")
map("n", "<leader>wk", "<C-w>k", "[W]indow [k] move one window up or above")
map("n", "<leader>wl", "<C-w>l", "[W]indow [l] move one window to the right")
map("n", "<leader>w.", "<C-w>L", "[W]indow [>] move the window to far left")
map("n", "<leader>wo", "<C-w>o", "[W]indow close all [O]thers")
map("n", "<leader>ws", "<C-w>x", "[W]indow [S]wap")
map("n", "<leader>wu", "<C-^>", "[W]indow [U]ndo jump")
map("n", "<leader>w=", "<C-w>=", "Resize [W]indows [=] equally")
-- map("n", "<leader>w,", "25<C-w><", "Resize [W]indows [,/<] smaller")
-- map("n", "<leader>w.", "25<C-w>>", "Resize [W]indows [./>] larger")
map("n", "<leader>w/", functions.split_window_vertically, "[W]indow split [/]vertically")
map("n", "<leader>w-", functions.split_window_horizontally, "[W]indow split [-]horizontally ")

map("n", "<leader>tn", ":TSContextToggle<CR>", "[T]oggle [N]ested treesitter context")
map("n", "<leader>tu", vim.cmd.UndotreeToggle, "[T]oggle [U]ndotree")
map("n", "<leader>th", ":Neotree close<CR>:set nofoldenable<CR>", "[T]oggle filetree [H]ide")
map("n", "<leader>to", functions.open_filetree, "[T]oggle filetree [O]pen")
map("n", "<leader>tb", ":Neotree buffers<CR>:set nofoldenable<CR>", "[T]oggle filetree open [B]uffers")
map("n", "<leader>tg", ":Neotree git_status<CR>:set nofoldenable<CR>", "[T]oggle filetree open [G]it status")
map("n", "<leader>tw", functions.toggle_line_wrap, "[T]oggle line [W]rap")
map("n", "<leader>tf", functions.toggle_formatting_on_save, "[T]oggle automatic [F]ormatting on save")
map("n", "<leader>ta", functions.toggle_ai_suggestions, "[T]oggle [C]odeium")
map("n", "<leader>tt", ":Trouble diagnostics<CR>", "[T]oggle [T]rouble aka Show file lsp diagnostics")

map("n", "<leader>pd", ":Telescope dir find_files<CR>", "search files in a [P]roject [D]irectory")
map("n", "<leader>pf", functions.search_project_files, "search through [P]roject [F]iles")

map("n", "<leader>bm", ":Messages<CR>", "display [B]uffer [M]essages")
map("n", "<leader>bN", ":enew<CR>", "[B]uffer [N]ew")
map("n", "<leader>bd", ":bp<bar>sp<bar>bn<bar>bd<CR>", "[B]uffer [D]elete current")
map("n", "<leader>bb", functions.search_buffers, "search through [B]uffers")
map("n", "<leader>bf", ":windo diffthis<CR>", "[B]uffers di[f]f")

local searchAndReplaceSearchTerm = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
map("n", "<leader>sr", searchAndReplaceSearchTerm, "[S]earch and [R]eplace file for current word", nil, false)
map("n", "<leader>sd", ":Telescope dir live_grep<CR>", "[S]earch file contents in a specific [D]irectory")
map("n", "<leader>sk", telescope.keymaps, "[S]earch [K]eymaps/commands")
map("n", "<leader>sh", telescope.help_tags, "[S]earch [H]elp tags")
map("n", "<leader>sp", functions.search_project_file_contents, "[S]earch file contents in [P]roject")
map("n", "<leader>s,", functions.search_project_html_usages, "[S]earch for HTML[<] tag uses in project")
map("n", "<leader>sq", functions.open_quickfix_of_search_term, "Open [S]earch of file in [Q]uickfix list")
map("n", "<leader>sl", functions.search_quickfix_list, "[S]earch quickfix [L]ist")
map("n", "<leader>sa", ":Telescope resume<CR>", "[S]earch [A]gain or telescope resume")
map({"n", "x", "o"}, "s", '<cmd>lua require("flash").jump()<cr>')
map({"n", "x", "o"}, "S", '<cmd>lua require("flash").treesitter()<cr>')
map("n", "<leader>/", ":noh<CR>", "clear [/]highlight from most recent search")

map("n", "<leader>fx", "<cmd>!chmod +x %<CR>", "[F]ile permissions - make e[X]ecutable")
map("n", "<leader>fj", ":%!jq .<CR>", "[F]ile format [J]son using jq")
map("n", "<leader>fs", ":%!sleek<CR>", "[F]ile format [S]QL using sleek")
map("n", "<leader>ff", functions.search_files, "[F]ind [F]iles")
map("n", "<leader>fr", functions.search_recent_files, "[F]ind [R]ecently opened files")
map("n", "<leader>fp", functions.search_dotfiles, "[Find] file in dotfiles [P]roject")
map("n", "<leader>fe", ":EslintFixAll<CR>", "[F]ile format/fix with [E]slint")
map("n", "<leader>ef", "<CMD>Oil<CR>", "[E]dit [F]iletree in buffer with Oil")
map("n", "<leader>u", ":e %:h:h:h/index.js<CR>m'", "Go [U]p an index file")
map("n", "<leader>i", functions.goto_javascript_import, "Go [I]nto an applause function file")

map("n", "<leader>jh", '/"[^_][^_].*": [^\\{]<CR>', "[J]SON [H]ighlight string values")
map("n", "<leader>js", '/\\(^.*__typename.*\\)\\@<!: "<CR>:noh<CR>t"llci"', "[J]ump to next JSON key, clear [S]tring")
map("n", "<leader>jq", '/\\(^.*__typename.*\\)\\@<!: "<CR>:noh<CR>t"lvt"xxi', "[J]ump to next JSON key, clear [Q]uotes")
map("n", "<leader>jv", "yy:enew<CR>p:%s/.\\{-}{/{<CR>:%!jq .<CR>", "[J]SON [V]iew log")

map("n", "<leader>cfp", functions.copy_absolute_file_path, "[C]opy absolute [F]ile [P]ath")
map("n", "<leader>cpp", functions.copy_project_file_path, "[C]opy [P]roject relative file [P]ath")
map("n", "<leader>cgb", functions.copy_current_branch_name, "[C]opy current [G]it [B]ranch name")
map("n", "<leader>cln", functions.copy_project_file_path_and_line_number, "[C]opy current file and [L]ine [N]umber")

map("n", "<leader>crc", functions.convert_to_camel_case, "[C]onvert to [C]amel Case (camelCase)")
map("n", "<leader>crd", functions.convert_to_dot_case, "[C]onvert to [D]ot Case (dot.case)")
map("n", "<leader>crk", functions.convert_to_kebab_case, "[C]onvert to [K]ebab Case (kebab-case)")
map("n", "<leader>crl", functions.convert_to_lower_case, "[C]onvert to [L]ower Case (lowercase)")
map("n", "<leader>crp", functions.convert_to_pascal_case, "[C]onvert to [P]ascal Case (PascalCase)")
map("n", "<leader>crs", functions.convert_to_snake_case, "[C]onvert to [S]nake Case (snake_case)")
map("n", "<leader>cru", functions.convert_to_upper_case, "[C]onvert to [U]pper Case (UPPERCASE)")

map("n", "<leader>vr", vim.cmd.so, "[V]im source/[R]eload file")

map("n", "gf", "<C-]>", "[G]o to [F]oreign Key", false, true, true)
map("v", "<CR>", "<leader>S", "Execute SQL query", false, true, true)
map("n", "<leader>gh", ":DiffviewFileHistory %<CR>", "[G]it [H]istory for current file")
map("n", "<leader>gl", functions.open_git_commits_with_file, "[G]it [List] commits that include file")
map("n", "<leader>gt", ":0Gclog<CR>", "[G]it [T]imemachine with quickfix list")
map("n", "<leader>gb", ":Git blame<CR>", "[G]it [B]lame")
map("n", "<leader>gr", functions.open_git_diff_with_pr_base, "[G]it open diff with PR Base in [Q]uickfix list")
map("n", "<leader>gq", functions.open_git_diff_with_master, "[G]it open diff with master in [Q]uickfix list")
map("n", "<leader>gd", functions.open_git_file_diff_with_pr_base, "[G]it [D]iff file with PR Base")
map("n", "<leader>gc", ":DiffviewClose<CR>", "[G]it diff [C]lose")
map("n", "<leader>ca", functions.open_github_pr_comment, "Git [C]omment [A]dd")
map("n", "<leader>cs", ":w!<CR>:!~/.dotfiles/nvim/scripts/add-github-comment.mjs<CR><C-^>", "git [C]omment [S]ave")

map("n", "<leader>dp", functions.insert_debug_print_statement, "[D]ebug - [P]rint")
map({"x", "n"}, "<leader>dv", functions.insert_debug_variable_statement, "[D]ebug - print [V]ariable")
map("n", "<leader>dd", functions.delete_debug_statements, "[D]ebug - [D]elete statements")
map("n", "<leader>di", "Odebugger<ESC>:w<CR>", "[D]ebug - [I]nsert debugger")
map("n", "<leader>df", functions.debug_function, "[D]ebug - run [F]unction")
map("n", "<leader>dt", functions.debug_test, "[D]ebug - run [T]est")
map("n", "<leader>db", ":Neotree close<CR>:DBUIToggle<CR>", "Open [D]ata[b]ase UI")

local generate_function_cmd = ":lua require('config.functions.generate-function')('%s')<CR>"
map("n", "<leader>ai", ":!~/.dotfiles/nvim/scripts/create-index.mjs %:p:h<CR>", "Generate [A]pplause [I]ndex File")
map("n", "<leader>ad", ":!~/.dotfiles/nvim/scripts/create-index.mjs %:p:h -<CR>", "Generate [A]pplause [D]efault Index")
map("n", "<leader>afa", string.format(generate_function_cmd, "actions"), "Create [A]ction Function")
map("n", "<leader>afr", string.format(generate_function_cmd, "alerts"), "Create [A]lert Function")
map("n", "<leader>afu", string.format(generate_function_cmd, "authorizations"), "Create [A]uthorization Function")
map("n", "<leader>afc", string.format(generate_function_cmd, "conditionals"), "Create [C]onditional Function")
map("n", "<leader>aff", string.format(generate_function_cmd, "filters"), "Create [F]ilter Function")
map("n", "<leader>afi", string.format(generate_function_cmd, "finders"), "Create [F]inder Function")
map("n", "<leader>afh", string.format(generate_function_cmd, "helpers"), "Create [H]elper Function")
map("n", "<leader>afk", string.format(generate_function_cmd, "locks"), "Create [L]ock Function")
map("n", "<leader>afl", string.format(generate_function_cmd, "loggers"), "Create [L]ogger Function")
map("n", "<leader>afq", string.format(generate_function_cmd, "queries"), "Create [Q]uery Function")
map("n", "<leader>afb", string.format(generate_function_cmd, "query_builders"), "Create [Q]uery [B]uilder Function")
map("n", "<leader>afd", string.format(generate_function_cmd, "schedulers"), "Create [S]cheduler Function")
map("n", "<leader>afs", string.format(generate_function_cmd, "serializers"), "Create [S]erializer Function")
map("n", "<leader>afv", string.format(generate_function_cmd, "validators"), "Create [V]alidator Function")

map("n", "<leader>rw", ":%s/\\s\\+$//e<CR>", "[R]emove [W]hitespace")
map("x", "<leader>ref", ":Refactor extract ", "[Re]factor - [E]xtract current selection to [F]unction", nil, false)
map("x", "<leader>reF", ":Refactor extract_to_file ", "[Re]factor - [E]xtract function to [F]ile", nil, false)
map("x", "<leader>rev", ":Refactor extract_var ", "[Re]factor - [E]xtract current selection to [V]ariable", nil, false)
map({"n", "x"}, "<leader>riv", ":Refactor inline_var", "[Re]factor - [I]nline [V]ariable", nil, false)
map("n", "<leader>rif", ":Refactor inline_func", "[Re]factor - [I]nline [F]unction", nil, false)
map("n", "<leader>rbf", ":Refactor extract_block", "[Re]factor - [E]xtract [B]lock to to [F]unction", nil, false)
map("n", "<leader>rbF", ":Refactor extract_block_to_file", "[Re]factor - [E]xtract [B]lock to [F]ile", nil, false)

map("n", "<leader>ha", harpoon_mark.add_file, "[H]arpoon - [A]dd file")
map("n", "<leader>hf", harpoon_ui.toggle_quick_menu, "[H]arpoon - list [F]iles")
map("n", "<leader>hq", ":lua require('harpoon.mark').to_quickfix_list()<CR>:copen<CR>", "[H]arpoon - [Q]uickfix list")
map("n", "<leader>h1", ":lua require('harpoon.ui').nav_file(1)<CR>", "[H]arpoon - [1]st file")
map("n", "<leader>h2", ":lua require('harpoon.ui').nav_file(2)<CR>", "[H]arpoon - [2]nd file")
map("n", "<leader>h3", ":lua require('harpoon.ui').nav_file(3)<CR>", "[H]arpoon - [3]rd file")
map("n", "<leader>h4", ":lua require('harpoon.ui').nav_file(4)<CR>", "[H]arpoon - [4]th file")

map("n", "<leader>ot", functions.open_terminal, "[O]pen [T]erminal")

map("v", "J", ":m '>+1<CR>gv=gv", "move selected lines down [J]")
map("v", "K", ":m '<-2<CR>gv=gv", "move selected lines up [K]")
map("n", "J", "mzJ`z", "move the line below [J] up to the end of current line")
map("n", "<M-down>", "<C-d>")
map("n", "<M-up>", "<C-u>")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "f", ":HopChar1<CR>")
map("n", "*", "yiw*")
map("n", "dd", functions.delete_line)

map("i", "<C-t>", "(╯°□°)╯︵ ┻━┻", "insert [T]ableflip")
map("i", "<C-s>", "¯\\_(ツ)_/¯", "insert [S]hrug")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-n>", ":cn<CR>", "move to [N]ext option in quickfix list")
map("n", "<C-p>", ":cp<CR>", "move to [P]revious option in quickfix list")

map("i", "<C-j>", functions.accept_ai_suggestion, "accept ai suggestion [j]", true)
map("i", "<C-x>", functions.clear_ai_suggestion, "clear ai suggestions [x]", true)
map("t", "<C-b>", "<C-\\><C-n>", "return [B]ack to vim from terminal")

vim.api.nvim_create_autocmd(
    "LspAttach",
    {
        desc = "LSP actions",
        callback = function(event)
            local map = function(mode, keys, func, desc)
                vim.keymap.set(mode, keys, func, {buffer = event.buf, remap = false, desc = desc})
            end
            map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", "[G]o to [D]efinition")
            map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", "[G]o to [D]eclaration")
            map("n", "gm", "<cmd>lua vim.lsp.buf.implementation()<cr>", "[G]o to I[M]plementation")
            map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", "[G]o to [T]ype [D]efinition")
            map("n", "gi", functions.run_import_code_action, "[G]enerate [I]mport")
            map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", "LSP Show Hover")
            map("n", "H", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "LSP Show [H]elp")
            map("n", "grr", "<cmd>lua vim.lsp.buf.references()<cr>", "LSP [G]o to [R]efe[R]ences in quickfix list")
            map("n", "grn", "<cmd>lua vim.lsp.buf.rename()<cr>", "LSP refactor/[R]e[N]ame")
            map("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", "LSP [G]o to code [A]ction")
            map("n", "ge", "<cmd>lua vim.diagnostic.open_float()<cr>", "LSP [G]o to [E]rror/open float")
            map("n", "[d", "<cmd>lua vim.diagnostic.goto_next()<cr>", "LSP move to [[]next [D]iagnostic")
            map("n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "LSP move to []]previous [D]iagnostic")
        end
    }
)
