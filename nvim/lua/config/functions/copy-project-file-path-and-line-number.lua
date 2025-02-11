return function()
    require("config.functions.copy")(vim.fn.expand("%:~:.") .. ":" .. vim.fn.line(".") + 1)
end
