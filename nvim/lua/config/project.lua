local json = require("lib.json")

local load_project_config = function()
    local cwd = vim.fn["getcwd"]()
    local config_file_path = cwd .. "/.neovim.json"
    local file = io.open(config_file_path, "r")
    if not file then
        return nil
    end

    local content = file:read("*all")
    file:close()

    local success, config = pcall(json.parse, content)
    if not success then
        return nil
    end

    return config
end

project_config = load_project_config()
