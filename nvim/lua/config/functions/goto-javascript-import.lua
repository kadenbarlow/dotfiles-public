local kebabCase = function(input)
    return string.gsub(input, "(%l)(%u)", "%1-%2"):gsub("(%d)(%u)", "%1-%2"):gsub("_", "-"):gsub("\\.", "-"):lower()
end

return function()
    local current_file_path = vim.fn.expand("%:h")
    local function_name = vim.fn.expand("<cword>")
    local move_cmd = string.format('gg/%s<CR>/from<CR>f"<ESC>l', function_name)
    vim.api.nvim_input(move_cmd)
    vim.schedule(
        function()
            local import_line = vim.api.nvim_get_current_line()
            vim.api.nvim_input("<C-o><C-o><C-o>")
            vim.schedule(
                function()
                    local import_path = string.match(import_line, '"(.-)"')
                    local resolved_import_path = current_file_path .. "/" .. import_path
                    local is_absolute_path = string.match(import_path, "%.js$")
                    local is_directory = vim.fn.isdirectory(resolved_import_path)

                    if is_absolute_path or is_directory ~= 1 then
                        vim.cmd("edit " .. current_file_path .. "/" .. import_path)
                    else
                        local function_folder_path = resolved_import_path .. "/" .. function_name
                        local function_folder_exists = vim.fn.isdirectory(function_folder_path)
                        local kebab_function_folder = kebabCase(function_name)
                        local kebab_function_folder_path = resolved_import_path .. "/" .. kebab_function_folder
                        local kebab_function_folder_exists = vim.fn.isdirectory(kebab_function_folder_path)

                        if function_folder_exists == 1 then
                            vim.cmd("edit " .. function_folder_path .. "/index.js")
                        elseif kebab_function_folder_exists == 1 then
                            vim.cmd("edit " .. kebab_function_folder_path .. "/index.js")
                        else
                            vim.cmd("edit " .. resolved_import_path .. "/index.js")
                        end
                    end
                end
            )
        end
    )
end
