return function()
    require("config.functions.copy")(vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", ""))
end
