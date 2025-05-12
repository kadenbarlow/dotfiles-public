return function(object, path, defaultValue)
    local value = object
    local c = 1
    while type(path[c]) ~= "nil" do
        if type(value) ~= "table" then
            return defaultValue
        end
        value = value[path[c]]
        c = c + 1
    end
    return value or defaultValue
end
