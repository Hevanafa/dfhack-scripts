-- Used particularly in adventure mode, after using combine-fish-cursor.
-- By Hevanafa, 29-06-2023
-- Edit: both data types don't match, it's not possible

qerror("Not possible.")

local cur = copyall(df.global.cursor)
local player = df.global.world.units.active[0]
local count = 0

for _, item in pairs(df.global.world.items.all) do
    if item:getType() == df.item_type.FISH and
        same_xyz(cur, item.pos) and
        item.flags.on_ground then

        -- FISH: .race, .caste
        -- MEAT: .mat_type, .mat_index

        -- print(item.type)
        local new_item = df.item.find(
            dfhack.items.createItem(
                df.item_type.MEAT,
                item:getSubtype(),
                item.race,
                item.caste,
                player)
        )

        assert(new_item, "failed to create item")

        dfhack.items.remove(df.item.find(item.id))

        count = count + 1
    end
end

print(("Transformed %d fish units into meat, have fun cooking!"):format(count))