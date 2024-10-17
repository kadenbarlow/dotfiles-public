local obj = {}
obj.__index = obj

local officeLightsEntityId = "switch.office_main_lights"
local officeFanEntityId = "fan.office_ceiling_fan"
hs.settings.set("secrets", hs.json.read("~/.dotfiles/hammerspoon/secrets.json"))

function obj:apiToken()
    if hs.settings.get("secrets").homeAssistant.apiToken then
        return hs.settings.get("secrets").homeAssistant.apiToken
    else
        print("You need to load a HomeAssistant API key in to hs.settings under secrets.homeAssistant.apiToken")
    end
end

function obj:toggleOfficeLights()
    hs.http.asyncPost(
        "http://homeassistant.local:8123/api/services/switch/toggle",
        hs.json.encode(
            {
                ["entity_id"] = officeLightsEntityId
            }
        ),
        {
            ["Authorization"] = "Bearer " .. obj:apiToken()
        },
        function(http_number, body, headers)
            print(http_number)
            print(body)
        end
    )
end

function obj:toggleOfficeFan()
    hs.http.asyncPost(
        "http://homeassistant.local:8123/api/services/fan/toggle",
        hs.json.encode(
            {
                ["entity_id"] = officeFanEntityId
            }
        ),
        {
            ["Authorization"] = "Bearer " .. obj:apiToken()
        },
        function(http_number, body, headers)
            print(http_number)
            print(body)
        end
    )
end

return obj
