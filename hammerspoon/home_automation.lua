local obj={}
obj.__index = obj

local entity_id = 'light.basement_lights_light'
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
    'http://192.168.0.60:8123/api/services/light/toggle',
    hs.json.encode(
      {
        ['entity_id'] = entity_id
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

function obj:updateOfficeLightsBrightness(delta)
  hs.http.asyncPost(
    'http://192.168.0.60:8123/api/services/light/turn_on',
    hs.json.encode(
      {
        ['entity_id'] = entity_id,
        ['brightness_step_pct'] = delta
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

function obj:increaseOfficeLightsBrightness()
  obj:updateOfficeLightsBrightness(30)
end

function obj:decreaseOfficeLightsBrightness()
  obj:updateOfficeLightsBrightness(-30)
end

return obj
