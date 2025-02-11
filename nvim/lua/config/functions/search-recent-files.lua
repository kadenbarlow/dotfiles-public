local builtin = require("telescope.builtin")

return function()
    builtin.oldfiles(
        {
            previewer = false
        }
    )
end
