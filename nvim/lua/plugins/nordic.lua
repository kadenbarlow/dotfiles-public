local clrs = require("nordic.colors")
local ctp_feline = require("catppuccin.groups.integrations.feline")
local nordic = require("nordic")
local feline = require("feline")

nordic.setup(
    {
        transparent_bg = true,
        reduced_blue = true,
        telescope = {
            style = "flat" -- Available styles: `classic`, `flat`.
        },
        ts_context = {
            dark_background = true -- Enables dark background for treesitter-context window
        }
    }
)
nordic.load()
vim.cmd [[highlight FoldColumn guifg=none guibg=none]]
vim.cmd [[highlight Visual guifg=none guibg=#242933]]

ctp_feline.setup(
    {
        assets = {
            left_separator = "",
            right_separator = "",
            mode_icon = "",
            dir = "󰉖",
            file = "󰈙",
            lsp = {
                server = "󰅡",
                error = "",
                warning = "",
                info = "",
                hint = ""
            },
            git = {
                branch = "",
                added = "",
                changed = "",
                removed = ""
            }
        },
        sett = {
            text = clrs.black0,
            bkg = "NONE",
            diffs = clrs.green.base,
            extras = clrs.overlay1,
            curr_file = clrs.orange.bright,
            curr_dir = clrs.yellow.base,
            show_modified = true -- show if the file has been modified
        },
        mode_colors = {
            ["n"] = {"NORMAL", clrs.orange.bright},
            ["no"] = {"N-PENDING", clrs.orange.bright},
            ["i"] = {"INSERT", clrs.green.base},
            ["ic"] = {"INSERT", clrs.green.base},
            ["t"] = {"TERMINAL", clrs.green.base},
            ["v"] = {"VISUAL", clrs.yellow.base},
            ["V"] = {"V-LINE", clrs.yellow.base},
            ["�"] = {"V-BLOCK", clrs.yellow.base},
            ["R"] = {"REPLACE", clrs.red.base},
            ["Rv"] = {"V-REPLACE", clrs.red.base},
            ["s"] = {"SELECT", clrs.red.base},
            ["S"] = {"S-LINE", clrs.red.base},
            ["�"] = {"S-BLOCK", clrs.red.base},
            ["c"] = {"COMMAND", clrs.magenta.base},
            ["cv"] = {"COMMAND", clrs.magenta.base},
            ["ce"] = {"COMMAND", clrs.magenta.base},
            ["r"] = {"PROMPT", clrs.cyan.base},
            ["rm"] = {"MORE", clrs.cyan.base},
            ["r?"] = {"CONFIRM", clrs.red.base},
            ["!"] = {"SHELL", clrs.green.base}
        },
        view = {
            lsp = {
                progress = true, -- if true the status bar will display an lsp progress indicator
                name = false, -- if true the status bar will display the lsp servers name, otherwise it will display the text "Lsp"
                exclude_lsp_names = {}, -- lsp server names that should not be displayed when name is set to true
                separator = "|" -- the separator used when there are multiple lsp servers
            }
        }
    }
)

local ctp_components = ctp_feline.get()
ctp_components.inactive[1][1].hl.bg = "NONE"

feline.setup(
    {
        components = ctp_components
    }
)

require("gitsigns").setup()
