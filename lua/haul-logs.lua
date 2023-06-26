-- By Hevanafa, 25-06-2023
-- This script is useful for when you break villager houses in towns by digging 1 level below their house

local unit = df.global.world.units.active[0]

assert(unit, "adventurer mode is required!")

for _, item in pairs(df.global.world.items.all) do
    if item:getType() == df.item_type.WOOD and
        item.flags.on_ground and
        item.pos.z < unit.pos.z then

        if not dfhack.items.moveToInventory(item, unit, 0, 0) then
            print("Could not put item: ", item)
        end
    end
end
