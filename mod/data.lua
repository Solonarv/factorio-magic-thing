mana_types = {"chthonic", "celestine", "motive", "still", "quintessent"}
mod_name = "magic-thing"
crystal_stack_size = 50

function icon_for(name)
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

local my_rock = table.deepcopy(data.raw["simple-entity"]["rock-big"])

my_rock.name = "crystalized-mana"

for _,ty in ipairs(mana_types) do
    table.insert(my_rock.loot,{
        count_max = 1,
        count_min = 1,
        item = "mana-crystal-"..ty,
        probability = 0.25
    })
end

data:extend(crystal_items)
data:extend{my_rock}