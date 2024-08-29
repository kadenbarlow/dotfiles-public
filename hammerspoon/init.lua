require("layouts")
local slack = require("slack")
local window = require("window_management")

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

-- f = window.maximizeWindow,
-- h = window.leftHalf,
-- l = window.rightHalf,
-- k = window.topHalf,
-- j = window.bottomHalf,
-- y = window.left30,
-- u = window.middle40,
-- i = window.right30,
-- n = window.left70,
-- m = window.right70,
-- b = window.middle50,
-- a = window.foregroundApplication("Chrome"),
-- d = window.foregroundApplication("Slack"),
-- g = window.foregroundApplication("Figma"),
-- ["1"] = ApplyLayout(DevLayout1),
-- ["2"] = ApplyLayout(DevLayout2),
-- ["3"] = ApplyLayout(DevLayout3)
bindKey(
    hyper,
    {
        y = center,
        r = hs.reload
    }
)

-- h = window.throwLeft,
-- l = window.throwRight,
-- k = window.throwUp,
-- j = window.throwDown,
-- f = window.maximizeAllWindows
bindKey(secondary, {})

bindKey(
    remap,
    {
        -- f19 = second key on left from top
        f20 = slack.toggleSlackMic
    }
)

hs.alert.show("Keyboard Config Loaded")
