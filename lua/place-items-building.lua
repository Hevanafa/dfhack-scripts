-- By Hevanafa, 24-06-2023
-- This script is particularly useful to put items on a trade depot in adventure mode, even though it's purely cosmetic.

local cur = copyall(df.global.cursor)

local building = dfhack.buildings.findAtTile(cur)

assert(building, "No buildings at cursor!")

local count = 0

for _, item in pairs(df.global.world.items.all) do
    if same_xyz(cur, item.pos) and 
        item.flags.on_ground then

        if dfhack.items.moveToBuilding(item, building) then
            count = count + 1
        end
    end
end

print(("Moved %d item(s)"):format(count))
