-- print(df.global.cursor.x)

-- 08-06-2023
-- This script deletes seeds at cursor position.

local count = 0
for k, item in pairs(df.global.world.items.all) do
    if same_xyz(df.global.cursor, item.pos) then
        if item:getType() == df.item_type.SEEDS then
            -- print(("item ID: %d"):format(item.id))

            count = count + 1

            dfhack.items.remove(
                df.item.find(item.id)
            )
        end
    end
end

if count > 0 then
    print(("Deleted %d seeds."):format(count))
end