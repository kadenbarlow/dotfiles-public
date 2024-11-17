local window = require("window_management")
local homeAutomation = require("home_automation")
local monitors = require("monitors")

monitors.applyLayout()
monitors.watch()

local hyper = {"cmd", "ctrl", "alt", "shift"}
local secondary = {"cmd", "alt"}
local remap = {}

hs.window.animationDuration = 0
-- hs.hotkey.bind({"alt"}, "space", window.foregroundApplication("kitty"))

local function bindKey(hyper, keyFuncTable)
    for key, fn in pairs(keyFuncTable) do
        if type(fn) == "function" then
            hs.hotkey.bind(hyper, key, fn)
        elseif type(fn) == "table" then
            hs.hotkey.bind(
                hyper,
                key,
                function()
                    for _, f in pairs(fn) do
                        f()
                    end
                end
            )
        end
    end
end

local function keyStroke(modifiers, key)
    return function()
        hs.eventtap.keyStroke(modifiers, key)
    end
end

local function keyStrokes(keys)
    return function()
        hs.eventtap.keyStrokes(keys)
    end
end

bindKey(hyper, {c = window.squareAndCenterOnScreen, r = hs.reload})

bindKey(secondary, {})

bindKey(
    remap,
    {
        f19 = homeAutomation.toggleOfficeLights,
        f18 = homeAutomation.toggleOfficeFan,
        f17 = keyStrokes("gcb kaden/CLAP-"),
        f16 = {keyStrokes("/hangout "), keyStroke({}, "return")}
    }
)

hs.alert.show("Keyboard Config Loaded")
