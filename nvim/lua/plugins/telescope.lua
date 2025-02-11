local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")

telescope.load_extension("dir")
telescope.setup(
    {
        defaults = {
            border = false,
            color_devicons = true,
            entry_prefix = "",
            layout_config = {
                anchor = "N",
                bottom_pane = {
                    height = 15,
                    preview_cutoff = 120,
                    prompt_position = "bottom"
                }
            },
            layout_strategy = "bottom_pane",
            multi_icon = "",
            path_display = function(opts, path)
                local path_parts = {}
                local index = 1
                for part in string.gmatch(path, "[^" .. "/" .. "]+") do
                    path_parts[index] = part
                    index = index + 1
                end
                local file_name =
                    path_parts[#path_parts - 1] and path_parts[#path_parts - 1] .. "/" .. path_parts[#path_parts] or
                    path_parts[#path_parts]
                return string.format("%s (%s)", file_name, path)
            end,
            preview = {msg_bg_fillchar = " "},
            preview_title = "",
            prompt_prefix = "",
            prompt_title = "",
            results_title = "",
            selection_caret = ""
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
            },
            live_grep_args = {
                mappings = {
                    i = {
                        ["<C-i>"] = lga_actions.quote_prompt({postfix = " --iglob "}),
                        ["<C-t>"] = lga_actions.quote_prompt({postfix = " --type "})
                    }
                }
            }
        }
    }
)
telescope.load_extension("fzf")

require("dir-telescope").setup(
    {
        hidden = false,
        show_preview = false
    }
)
