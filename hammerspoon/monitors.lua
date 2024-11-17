local module = {}

module.applyLayout = function()
    local home = os.getenv("HOME")
    local rightMonitor = hs.screen.allScreens()[2]
    if rightMonitor == nil then
        hs.task.new(home .. "/.dotfiles/aerospace/apply-laptop-layout.sh", nil):start()
    else
        hs.task.new(home .. "/.dotfiles/aerospace/apply-widescreen-layout.sh", nil):start()
    end
end

module.watch = function()
    hs.screen.watcher.new(module.applyLayout):start()
end

return module
