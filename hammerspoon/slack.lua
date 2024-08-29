module = {}

module.toggleSlackMic = function()
    hs.eventtap.keyStroke({"cmd", "shift"}, "space")
end

return module
