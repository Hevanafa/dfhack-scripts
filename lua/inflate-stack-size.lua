local cursor = copyall(df.global.cursor)

for _, item in pairs(df.global.world.items.all) do
    if same_xyz(cursor, item.pos) and not item.flags.in_inventory then
        print(item.id)
        item.stack_size = item.stack_size * 10
    end
end
