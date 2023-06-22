-- 16-06-2023

local cur = copyall(df.global.cursor)

for _, item in pairs(df.global.world.items.all) do
    if same_xyz(cur, item.pos) and item.flags.owned then

        -- local item_type = item:getType()
        -- local x, y, z = pos2xyz(item.pos)

        print(("%d {%s}%s%s"):format(
            item.id,
            item.pos and ("%d %d %d"):format(item.pos.x, item.pos.y, item.pos.z) or "?",
            item.flags.hidden and " (hidden)" or "",
            item.flags.in_inventory and " (in storage)" or ""
        ))

        -- print(df.item_type[item_type])
    end
end