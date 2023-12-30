local telescope = require("telescope")
telescope.load_extension("dir")
telescope.load_extension("vim_bookmarks")
telescope.setup(
    {
        defaults = {
            path_display = {
                "truncate"
            }
        },
        pickers = {
            find_files = {
                previewer = false
            }
        },
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case" -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        }
    }
)
telescope.load_extension("fzf")

require("dir-telescope").setup(
    {
        hidden = false,
        show_preview = false
        -- no_ignore = false,
    }
)
