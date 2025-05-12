return function()
    local camel_case =
        vim.fn.expand("<cword>"):gsub("(%l)(%u)", "%1_%2"):gsub("(%d)(%u)", "%1_%2"):gsub("-", "_"):lower():gsub(
        "_?([^_]+)",
        function(word)
            return string.gsub(word, "^%l", string.upper)
        end
    ):gsub("^%u", string.lower)

    vim.cmd("normal ciw" .. camel_case)
end
