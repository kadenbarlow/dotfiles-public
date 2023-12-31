local window = require('window_management')
require('layouts')

-- Hotkey Combinations
local hyper = {"cmd", "ctrl", "alt", "shift"}
local secondary = {"cmd", "alt"}
local remap = {}

hs.window.animationDuration = 0
-- hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", hs.reload):start()
hs.alert.show("Keyboard Config Loaded")

-- Apply Layout Bindings
hs.hotkey.bind(hyper, "1", function() ApplyLayout(DevLayout1) end)
hs.hotkey.bind(hyper, "2", function() ApplyLayout(DevLayout2) end)
hs.hotkey.bind(hyper, "3", function() ApplyLayout(DevLayout3) end)
hs.hotkey.bind(hyper, "4", function() ApplyLayout(DevLayout4) end)

hs.hotkey.bind(hyper, "r", hs.reload)

hs.hotkey.bind(secondary, "f", function()
  for _,window in pairs(hs.window.allWindows()) do
    hs.grid.maximizeWindow(window)
  end
end)

local function windowBind(hyper, keyFuncTable)
  for key,fn in pairs(keyFuncTable) do
    hs.hotkey.bind(hyper, key, fn)
  end
end

local function foregroundApplication(application)
  return function()
    local app = hs.application.get(application)
    if app then
      if not app:mainWindow() then
        app:selectMenuItem({application, "New OS window"})
      elseif app:isFrontmost() then
        app:hide()
      else
        app:activate()
      end
    else
      hs.application.launchOrFocus(application)
    end
  end
end

local function toggleTandemMic()
  hs.eventtap.keyStroke({"cmd", "shift"}, "m")
end

local function toggleTandemVideo()
  hs.eventtap.keyStroke({"cmd", "shift"}, ",")
end

-- Keybindings
hs.hotkey.bind({"alt"}, "space", foregroundApplication("kitty"))

windowBind(remap, {
  -- f16
  -- f17
  -- f18 = ,
  f19 = toggleTandemVideo,
  f20 = toggleTandemMic,
})

windowBind(hyper, {
  f = window.maximizeWindow,
  c = window.centerOnScreen,
  s = window.square,
  h = window.leftHalf,
  l = window.rightHalf,
  k = window.topHalf,
  j = window.bottomHalf,
  y = window.left30,
  u = window.middle40,
  i = window.right30,
  n = window.left70,
  m = window.right70,
  b = window.middle50,
  a = foregroundApplication("Slack"),
  d = foregroundApplication("Google Chrome"),
  e = foregroundApplication("MongoDB Compass"),
})

windowBind(secondary, {
  h = window.throwLeft,
  l = window.throwRight,
  k = window.throwUp,
  j = window.throwDown,
})
