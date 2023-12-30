function CodeiumAccept()
    return vim.fn["codeium#Accept"]()
end

function CodeiumClear()
    return vim.fn["codeium#Clear"]()
end

function CodeiumCycleCompletionsBackward()
    return vim.fn["codeium#CycleCompletions"](-1)
end

function CodeiumCycleCompletionsForward()
    return vim.fn["codeium#CycleCompletions"](1)
end

function ToggleCodeium()
    vim.g.codeium_enabled = not vim.g.codeium_enabled
end
