return function()
    local dot_case =
        vim.fn.expand("<cword>"):gsub("(%l)(%u)", "%1.%2"):gsub("(%d)(%u)", "%1.%2"):gsub("_", "."):gsub("-", ".")
    vim.cmd("normal ciw" .. dot_case)
end
