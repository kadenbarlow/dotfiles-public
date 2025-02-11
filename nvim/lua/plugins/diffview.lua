local actions = require("diffview.actions")

require("diffview").setup(
    {
        keymaps = {
            diff2 = {
                {
                    "n",
                    "<C-n>",
                    ":DiffviewClose<CR>:cn<CR>:lua require('config.functions.open-git-file-diff-with-pr-base')()<CR>",
                    {desc = "Open the diff for the next file"}
                },
                {
                    "n",
                    "<C-p>",
                    ":DiffviewClose<CR>:cp<CR>:lua require('config.functions.open-git-file-diff-with-pr-base')()<CR>",
                    {desc = "Open the diff for the previous file"}
                }
            },
            view = {
                {"n", "<C-n>", actions.select_next_entry, {desc = "Open the diff for the next file"}},
                {"n", "<C-p>", actions.select_prev_entry, {desc = "Open the diff for the previous file"}}
            },
            file_panel = {
                {"n", "<C-n>", actions.select_next_entry, {desc = "Open the diff for the next file"}},
                {"n", "<C-p>", actions.select_prev_entry, {desc = "Open the diff for the previous file"}}
            },
            file_history_panel = {
                {"n", "<C-n>", actions.select_next_entry, {desc = "Open the diff for the next file"}},
                {"n", "<C-p>", actions.select_prev_entry, {desc = "Open the diff for the previous file"}}
            }
        }
    }
)
