-- transform seeds to plants
-- based on count-seeds-cursor
-- 10-06-2023
-- see transform-seeds copy to see where I got the references

local cursor = copyall(df.global.cursor)


local nearest_unit
local nearest = 10000

for _, unit in pairs(df.global.world.units.all) do
    local pos = copyall(unit.pos)
    local dist = math.sqrt((cursor.x - pos.x) ^ 2 + (cursor.y - pos.y) ^ 2 + (cursor.z - pos.z) ^ 2)

    if nearest > dist then
        nearest = dist
        nearest_unit = unit
        break
    end
end


if nearest_unit == nil then
    qerror("Can't find the nearest unit!")
end

print(("Who is the nearest unit? %s"):format(dfhack.units.getRaceName(nearest_unit)))
print(("Distance: %.2f"):format(nearest))
local player_unit = df.global.world.units.active[0]
local dist = math.sqrt((cursor.x - player_unit.pos.x) ^ 2 + (cursor.y - player_unit.pos.y) ^ 2 + (cursor.z - player_unit.pos.z) ^ 2)
print(("Distance from player: %.2f"):format(dist))
do return end

local count = 0

for _, item in pairs(df.global.world.items.all) do
    if item:getType() == df.item_type.SEEDS and
        same_xyz(cursor, item.pos) then

        -- print(dfhack.items.getDescription(item, 0))

        local item_type = df.item_type.PLANT
        local subtype = item:getSubtype()

        -- magic constant obtained from gui/create-item
        local mat_type = 419 -- STRUCTURAL_PLANT_MAT; item.mat_type
        local mat_index = item.mat_index

        -- print(item_type.." "..subtype.." "..mat_type.." "..mat_index)

        local new_item = df.item.find(
            dfhack.items.createItem(
                item_type, subtype,
                mat_type, mat_index,
                nearest_unit))
        
        local stack_size = 1 + math.random(0, 2)
        new_item:setStackSize(stack_size)

        -- print(newItem.mat_type)
        -- print(newItem.mat_index)

        -- unsafe
        -- item:delete()

        assert(new_item, "failed to create item")
        
        print("Old item ID:" .. item.id)
        print("New item ID:" .. new_item.id)

        -- dfhack.items.remove(
        --     df.item.find(item.id)
        -- )

        count = count + stack_size
    end
end

print(("Transformed seeds at cursor, yielding %d plants"):format(count))
