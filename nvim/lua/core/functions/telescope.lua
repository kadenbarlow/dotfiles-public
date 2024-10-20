local builtin = require("telescope.builtin")
local telescope = require("telescope")

function FindDotfile()
    builtin.git_files({cwd = "~/.dotfiles", show_untracked = true, previewer = false})
end

function FindFiles()
    builtin.find_files(
        {
            previewer = false,
            hidden = true,
            no_ignore = true,
            find_command = {"rg", "--files", "--hidden", "--glob", "!**/{.git,node_modules,.cache,.jest-cache}/*"}
        }
    )
end

function FindRecentFiles()
    builtin.oldfiles({previewer = false})
end

function SearchBuffers()
    builtin.buffers({previewer = false})
end

function SearchProjectFileContents()
    telescope.extensions.live_grep_args.live_grep_args({previewer = false})
end

function SearchForHtmlUsagesInProject()
    telescope.extensions.live_grep_args.live_grep_args({default_text = "<" .. vim.fn.expand("<cword>")})
end

function SearchProjectFiles()
    builtin.git_files({show_untracked = true, previewer = false})
end

function SearchQuickfixList()
    builtin.quickfix()
    vim.cmd(":cclose")
end
