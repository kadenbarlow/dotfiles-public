local builtin = require("telescope.builtin")

return function()
    builtin.buffers(
        {
            previewer = false
        }
    )
end
