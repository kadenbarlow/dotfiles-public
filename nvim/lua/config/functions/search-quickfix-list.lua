local builtin = require("telescope.builtin")

return function()
    builtin.quickfix()
    vim.cmd(":cclose")
end
