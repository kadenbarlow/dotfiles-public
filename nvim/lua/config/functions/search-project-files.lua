local builtin = require("telescope.builtin")

return function()
    builtin.git_files(
        {
            show_untracked = true,
            previewer = false
        }
    )
end
