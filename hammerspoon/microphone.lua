local obj={}
obj.__index = obj

local menu = hs.menubar.new():setIcon(iconAscii)

function obj:updateMicMute(muted)
	if muted == -1 then
		muted = hs.audiodevice.defaultInputDevice():muted()
	end
	if muted then
		local icon = hs.image.imageFromURL("https://img.icons8.com/external-anggara-filled-outline-anggara-putra/15/000000/external-mic-off-communication-anggara-filled-outline-anggara-putra.png")
		obj.mute_menu:setIcon(icon)
    obj.mute_menu:setTitle("Off")
	else
		local icon = hs.image.imageFromURL("https://img.icons8.com/fluency-systems-filled/16/000000/microphone.png")
		obj.mute_menu:setIcon(icon)
    obj.mute_menu:setTitle("HOT")
	end
end

--- MicMute:toggleMicMute()
--- Method
--- Toggle mic mute on/off
---
function obj:toggleMicMute()
	local mic = hs.audiodevice.defaultInputDevice()
	local zoom = hs.application'Zoom'
	if mic:muted() then
		mic:setMuted(false)
		if zoom then
			local ok = zoom:selectMenuItem'Unmute Audio'
			if not ok then
				hs.timer.doAfter(0.5, function()
					zoom:selectMenuItem'Unmute Audio'
				end)
			end
		end
	else
		mic:setMuted(true)
		if zoom then
			local ok = zoom:selectMenuItem'Mute Audio'
			if not ok then
				hs.timer.doAfter(0.5, function()
					zoom:selectMenuItem'Mute Audio'
				end)
			end
		end
	end
	obj:updateMicMute(-1)
end


obj.time_since_mute = 0
obj.mute_menu = hs.menubar.new()
obj.mute_menu:setClickCallback(function()
	obj:toggleMicMute()
end)
obj:updateMicMute(-1)

return obj
