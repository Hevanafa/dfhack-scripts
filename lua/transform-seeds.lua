-- transform seeds to plants
-- based on count-seeds-cursor
-- 10-06-2023
-- see transform-seeds copy to see where I got the references

local cursor = copyall(df.global.cursor)

local player_unit = df.global.world.units.active[0]
assert(player_unit, "Can't find player unit!")

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
                player_unit))
        
        local stack_size = 1 + math.random(0, 2)
        new_item:setStackSize(stack_size)

        -- print(newItem.mat_type)
        -- print(newItem.mat_index)

        -- unsafe
        -- item:delete()

        assert(new_item, "failed to create item")
        
        print("Old item ID:" .. item.id)
        print("New item ID:" .. new_item.id)

        dfhack.items.remove(
            df.item.find(item.id)
        )

        count = count + stack_size
    end
end

print(("Transformed seeds at cursor, yielding %d plants"):format(count))
