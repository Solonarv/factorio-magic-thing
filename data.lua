require("util")

local mana_types = {"chthonic", "celestine", "motive", "still", "quintessent"}
local mod_name = "magic-thing"
local crystal_stack_size = 50

local function icon_for(name)
    return "__"..mod_name.."__/graphics/" .. name .. ".png"
end


local crystal_items = {}
for _,ty in ipairs(mana_types) do
    local name = "mana-crystal-" .. ty
    table.insert(crystal_items, {
        name = name,
        icon = icon_for(name),
        icon_size = 32,
        type = "item",
        stack_size = crystal_stack_size
    })
end

local rock_big = table.deepcopy(data.raw["simple-entity"]["rock-big"])
local rock_huge = table.deepcopy(data.raw["simple-entity"]["rock-huge"])
for _,ty in ipairs(mana_types) do
    table.insert(rock_big.loot, {
        count_max = 1,
        count_min = 1,
        item = "mana-crystal-"..ty,
        probability = 0.2
    })
    table.insert(rock_huge.loot, {
        count_max = 1,
        count_min = 4,
        item = "mana-crystal-"..ty,
        probability = 0.2
    })
end

data:extend(crystal_items)
data:extend{rock_big, rock_huge}