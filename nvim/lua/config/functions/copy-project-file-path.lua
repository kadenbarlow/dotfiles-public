return function()
    require("config.functions.copy")(vim.fn.expand("%:~:."))
end
