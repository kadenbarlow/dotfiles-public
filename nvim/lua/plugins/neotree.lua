require("neo-tree").setup(
    {
        close_if_last_window = true,
        default_component_configs = {
            indent = {
                indent_size = 2,
                padding = 1,
                with_markers = false
            },
            git_status = {
                symbols = {
                    added = "",
                    modified = "",
                    deleted = "",
                    renamed = "",
                    untracked = "",
                    ignored = "",
                    unstaged = "",
                    staged = "",
                    conflict = ""
                }
            }
        },
        enable_git_status = true,
        enable_diagnostics = false,
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = false
            }
        },
        window = {
            width = 56
        }
    }
)
