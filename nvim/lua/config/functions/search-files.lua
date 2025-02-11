local builtin = require("telescope.builtin")

return function()
    builtin.find_files(
        {
            previewer = false,
            hidden = true,
            no_ignore = true,
            find_command = {
                "rg",
                "--files",
                "--hidden",
                "--glob",
                "!**/{.git,node_modules,.cache,.jest-cache}/*"
            }
        }
    )
end
