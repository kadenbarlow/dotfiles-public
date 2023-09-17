local wifiMenu = hs.menubar.new()
local function ssidChangedCallback()
    SSID = hs.wifi.currentNetwork()
    if SSID == nil then
        SSID = "Disconnected"
    end
    wifiMenu:setIcon(hs.image.imageFromURL("https://img.icons8.com/ios-filled/16/000000/wifi--v1.png"))
    wifiMenu:setTitle(SSID)
end

local function openWifi()
  hs.execute('open "x-apple.systempreferences:com.apple.preference.network"')
end
wifiMenu:setClickCallback(openWifi)


local wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()
ssidChangedCallback()
