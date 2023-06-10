local cursor = copyall(df.global.cursor)

for _, item in pairs(df.global.world.items.all) do
    if same_xyz(cursor, item.pos) then
        print(item:getType(), item:getSubtype(), item.mat_type, item.mat_index)
    end
end
