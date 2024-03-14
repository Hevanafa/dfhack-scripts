-- Used particularly in adventure mode, after using combine-fish-cursor.
-- This makes it possible to cook fish in adventurer mode.  Basically converting prepared fish into meat.
-- By Hevanafa, 14-03-2024
-- Based on my old script fish-to-meat-cursor.lua

local cur = copyall(df.global.cursor)
local player_unit = df.global.world.units.active[0]
local count = 0

local meat_mat_type = 21

for _, item in pairs(df.global.world.items.all) do
    if item:getType() == df.item_type.FISH and
        same_xyz(cur, item.pos) and
        item.flags.on_ground then

        -- FISH: .race, .caste
        -- MEAT: .mat_type, .mat_index

        -- print(item.type)
        local new_item = df.item.find(
            dfhack.items.createItem(
                df.item_type.MEAT, -1,
                meat_mat_type, item.race,
                player_unit)
        )

        assert(new_item, "failed to create item")

        new_item.pos = xyz2pos(pos2xyz(item.pos))
        new_item.stack_size = item.stack_size
        new_item:calculateWeight()

        dfhack.items.remove(df.item.find(item.id))

        count = count + new_item.stack_size
    end
end

print(("Transformed %d fish units into meat, have fun cooking!"):format(count))