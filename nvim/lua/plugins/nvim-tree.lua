require("nvim-tree").setup(
    {
        sort_by = "case_sensitive",
        renderer = {
            group_empty = true
        },
        filters = {
            dotfiles = false
        },
        sync_root_with_cwd = true,
        view = {
            width = 60
        }
    }
)
