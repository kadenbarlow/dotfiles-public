return function()
    local filepath = vim.fn.expand("%:~:.")
    local line_number = vim.fn.line(".")
    local comment_content =
        string.format(
        "<!--- Github PR Comment -->\n" .. "<!-- File Path: %s -->\n" .. "<!-- Line Number: %d -->\n\n",
        filepath,
        line_number
    )

    local tmp_file = "/tmp/git-comment.md"
    local file = io.open(tmp_file, "w")
    if file then
        file:write(comment_content)
        file:close()
        vim.cmd("edit " .. tmp_file)
    else
        print("Error creating tmp file.")
    end
end
