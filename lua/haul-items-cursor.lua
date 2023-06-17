-- By Hevanafa, 18-06-2023
-- This script is useful for when you want to feed your pets but they can't pick up food items.

local unit = df.global.world.units.active[0]
local cursor = copyall(df.global.cursor)

assert(cursor, "(l)ook mode is required!")

for _, item in pairs(df.global.world.items.all) do
    if same_xyz(cursor, item.pos) then
        if not dfhack.items.moveToInventory(item, unit, 0, 0) then
            print("Could not put item: ", item)
        end
    end
end
