local builtin = require("telescope.builtin")

return function()
    builtin.git_files(
        {
            cwd = "~/.dotfiles",
            show_untracked = true,
            previewer = false
        }
    )
end
