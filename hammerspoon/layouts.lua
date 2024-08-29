-- Monitor Names
local laptop = "857650FE-4FF4-B708-4EB4-CF1E95BC3506"
local verticalLeft = "5847BB44-5FA4-42B0-9238-A5BDC6A76CDA"
local verticalRight = "AE52F452-76DD-4943-80F4-9B86B1778091"
local horizontal = "9FE3B6281-FA3A-4ACB-929A-C50E4A827FB4"

for _, item in pairs(hs.screen.allScreens()) do
    if item:getUUID() == laptop then
        laptop = item
    end
    if item:getUUID() == horizontal then
        PrimaryMonitor = item
    end
    if item:getUUID() == verticalRight then
        RightMonitor = item
    end
    if item:getUUID() == verticalLeft then
        LeftMonitor = item
    end
end

local upper50 = {x = 0, y = 0, w = 1, h = 0.5}
local lower50 = {x = 0, y = 0.5, w = 1, h = 0.5}
local left30 = {x = 0, y = 0, w = 0.30, h = 1}
-- local middle40 = {x = 0.3, y = 0, w = 0.4, h = 1}
-- local right30 = {x = 0.7, y = 0, w = 0.3, h = 1}
local right70 = {x = 0.3, y = 0, w = 0.7, h = 1}
-- local middle50 = {x = 0.25, y = 0, w = 0.5, h = 1}
-- local middle50 = {x=0, y=0.25, w=1, h=0.5}
-- local upper25 = {x=0, y=0, w=1, h=0.25}
-- local lower25 = {x=0, y=.75, w=1, h=0.25}
-- local lower75 = {x=0, y=.25, w=1, h=0.75}

DevLayout1 = {
    primary = 0,
    right = 270,
    left = 90,
    windows = {
        {"Google Chrome", nil, PrimaryMonitor, hs.layout.left50, nil, nil},
        {"kitty", nil, PrimaryMonitor, hs.layout.right50, nil, nil},
        {"Slack", nil, RightMonitor, upper50, nil, nil},
        {"Tandem", nil, RightMonitor, lower50, nil, nil},
        {"MongoDB Compass", nil, PrimaryMonitor, hs.layout.left50, nil, nil},
        {"Figma", nil, PrimaryMonitor, hs.layout.left50, nil, nil},
        -- {"Safari", nil, PrimaryMonitor, hs.layout.left50, nil, nil},
        {"Messages", nil, PrimaryMonitor, hs.layout.right50, nil, nil},
        {"Spotify", nil, RightMonitor, lower50, nil, nil}
    }
}

DevLayout3 = {
    primary = 0,
    right = 270,
    left = 90,
    windows = {
        {"Google Chrome", nil, PrimaryMonitor, left30, nil, nil},
        {"kitty", nil, PrimaryMonitor, right70, nil, nil},
        {"MongoDB Compass", nil, PrimaryMonitor, left30, nil, nil},
        {"Tandem", nil, RightMonitor, lower50, nil, nil},
        {"Slack", nil, RightMonitor, hs.layout.maximized, nil, nil},
        {"Figma", nil, PrimaryMonitor, left30, nil, nil},
        -- {"Safari", nil, PrimaryMonitor, hs.layout.left50, nil, nil},
        {"Messages", nil, PrimaryMonitor, hs.layout.right50, nil, nil},
        {"Spotify", nil, RightMonitor, hs.layout.maximized, nil, nil}
    }
}

DevLayout2 = {
    primary = 0,
    right = 270,
    left = 90,
    windows = {
        {"Google Chrome", nil, PrimaryMonitor, hs.layout.left50, nil, nil},
        {"kitty", nil, PrimaryMonitor, hs.layout.right50, nil, nil},
        {"Slack", nil, PrimaryMonitor, hs.layout.right50, nil, nil},
        {"Tandem", nil, RightMonitor, lower50, nil, nil},
        {"MongoDB Compass", nil, PrimaryMonitor, hs.layout.left50, nil, nil},
        {"Figma", nil, PrimaryMonitor, hs.layout.left50, nil, nil},
        -- {"Safari", nil, PrimaryMonitor, hs.layout.left50, nil, nil},
        {"Messages", nil, PrimaryMonitor, hs.layout.right50, nil, nil},
        {"Spotify", nil, RightMonitor, hs.layout.maximized, nil, nil}
    }
}

function ApplyLayout(layout)
    return function()
        hs.layout.apply(layout.windows)

        if layout.primary then
            PrimaryMonitor:rotate(layout.primary)
        end

        if layout.right then
            RightMonitor:rotate(layout.right)
        end

        if layout.left then
            LeftMonitor:rotate(layout.left)
        end
    end
end
