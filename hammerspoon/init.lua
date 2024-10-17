local window = require("window_management")
local homeAutomation = require("home_automation")

local hyper = {"cmd", "ctrl", "alt", "shift"}
local secondary = {"cmd", "alt"}
local remap = {}

hs.window.animationDuration = 0
hs.hotkey.bind({"alt"}, "space", window.foregroundApplication("kitty"))

local function bindKey(hyper, keyFuncTable)
    for key, fn in pairs(keyFuncTable) do
        hs.hotkey.bind(hyper, key, fn)
    end
end

local function center()
    window.square()
    window.centerOnScreen()
end

bindKey(hyper, {y = center, r = hs.reload})
bindKey(secondary, {})
bindKey(
    remap,
    {
        f17 = function()
            hs.eventtap.keyStrokes("gcb kaden/CLAP-")
        end,
        f19 = homeAutomation.toggleOfficeLights,
        f18 = homeAutomation.toggleOfficeFan
    }
)

hs.alert.show("Keyboard Config Loaded")
