require("world/manasphere")

script.on_init(function()
    
end)

script.on_nth_tick(64, function()
    for _, surface in pairs(game.surfaces) do
        Manasphere.tick_manasphere_of_surface(surface)
    end
end)