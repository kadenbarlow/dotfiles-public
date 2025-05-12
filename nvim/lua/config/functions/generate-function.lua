return function(folder)
    vim.cmd("w")
    local word = vim.fn.expand("<cword>")
    local command_template = "~/.dotfiles/nvim/scripts/create-function.mjs %s %s %s"
    local cmd = string.format(command_template, vim.fn.expand("%:p:h"), folder, word)

    local file_path = vim.fn.trim(vim.fn.system(cmd))
    vim.cmd("FormatWrite")
    if file_path ~= "" then
        vim.cmd("edit " .. vim.fn.fnameescape(file_path))
    end
end
