local get = require("lib.get")
local neotree = require("neo-tree")

local last_window_size = nil

return function()
    local width_percentage = get(project_config, {"filetree", "width"}, 32) / 100
    local is_widescreen = vim.o.columns > 172
    local width = is_widescreen and math.floor(vim.o.columns * width_percentage) or 40

    if (not last_window_size) or (last_window_size ~= width) then
        neotree.setup(
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
                    width = width
                }
            }
        )
        last_window_size = width
    end

    vim.cmd("DBUIClose")
    vim.cmd("Neotree reveal")
    vim.cmd("set nofoldenable")
end
