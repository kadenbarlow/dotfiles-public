module = {}

module.toggleTandemMic = function()
    hs.eventtap.keyStroke({"cmd", "shift"}, "m")
end

module.toggleTandemVideo = function()
    hs.eventtap.keyStroke({"cmd", "shift"}, ",")
end

return module
