return function()
    local first_option = true
    vim.lsp.buf.code_action(
        {
            filter = function(action)
                if first_option and (action.title:match("Update import") or action.title:match("Add import")) then
                    first_option = false
                    return true
                end
            end,
            apply = true
        }
    )
end
