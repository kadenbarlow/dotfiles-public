-- My last job had messed something up on my computer that disabled the ability to have the battery icon and
-- percentage in the status bar so wrote this to add my own icon and percentage and time remaining to the status bar.

local batteryMenu = hs.menubar.new()
local function batteryChangedCallback()
    local percentage = hs.battery.percentage()
    local timeRemaining = hs.battery.timeRemaining()

    if percentage <= 20 then
      batteryMenu:setIcon(hs.image.imageFromURL("https://img.icons8.com/ios-glyphs/20/000000/low-battery.png"))
    elseif percentage > 20 and percentage <= 80 then
      batteryMenu:setIcon(hs.image.imageFromURL("https://img.icons8.com/ios-glyphs/20/000000/medium-battery.png"))
    elseif percentage > 80 then
      batteryMenu:setIcon(hs.image.imageFromURL("https://img.icons8.com/ios-glyphs/20/000000/full-battery.png"))
    end

    if timeRemaining > 0 then
      batteryMenu:setTitle(" " .. math.floor(percentage) .. '% - ' .. (math.floor(timeRemaining/60)) .. "h " .. (math.floor(timeRemaining%60)) .. "m" )
    else
      batteryMenu:setTitle(" " .. math.floor(percentage) .. '%')
    end
end

local function openBattery()
  hs.execute('open "x-apple.systempreferences:com.apple.preference.battery"')
end
batteryMenu:setClickCallback(openBattery)

local batteryWatcher = hs.battery.watcher.new(batteryChangedCallback)
batteryWatcher:start()
batteryChangedCallback()
