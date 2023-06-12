local cursor = copyall(df.global.cursor)

assert(cursor, "(l)ook mode is required")

for _, item in pairs(df.global.world.items.all) do
    if same_xyz(cursor, item.pos) and
        not item.flags.in_inventory then

        local item_type = item:getType()
        print(item.id, item_type)
        print(df.item_type[item_type])
    end
end