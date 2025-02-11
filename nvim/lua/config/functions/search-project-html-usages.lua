local telescope = require("telescope")

return function()
    telescope.extensions.live_grep_args.live_grep_args(
        {
            default_text = "<" .. vim.fn.expand("<cword>")
        }
    )
end
