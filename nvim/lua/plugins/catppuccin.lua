require("catppuccin").setup(
    {
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = true, -- disables setting the background color.
        term_colors = true -- sets terminal colors (e.g. `g:terminal_color_0`)
    }
)

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

local ctp_feline = require("catppuccin.groups.integrations.feline")

require("feline").setup(
    {
        components = ctp_feline.get(),
        force_inactive = {
            filetypes = {
                "^neo%-tree$"
            }
        }
    }
)

require("gitsigns").setup()
