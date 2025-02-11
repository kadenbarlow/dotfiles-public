return function()
    local file = io.open("/tmp/git-comment-base.txt")
    if file then
        local base = file:read()
        file:close()
        vim.cmd("DiffviewOpen " .. base .. " " .. vim.fn.expand("%:p"))
        vim.cmd("DiffviewToggleFiles")
    else
        print("Error reading tmp file.")
    end
end
