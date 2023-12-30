local builtin = require("telescope.builtin")
local telescope = require("telescope")

function FindDotfile()
    builtin.git_files({cwd = "~/.dotfiles", show_untracked = true, previewer = false})
end

function FindFiles()
    builtin.find_files({previewer = false})
end

function FindRecentFiles()
    builtin.oldfiles({previewer = false})
end

function SearchBookmarks()
    telescope.extensions.vim_bookmarks.all()
end

function SearchBuffers()
    builtin.buffers({previewer = false})
end

function SearchProjectFileContents()
    telescope.extensions.live_grep_args.live_grep_args()
end

function SearchProjectFiles()
    builtin.git_files({show_untracked = true, previewer = false})
end
