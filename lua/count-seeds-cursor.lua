local count = 0

local pos = copyall(df.global.cursor)

for _, item in pairs(df.global.world.items.all) do
    if item:getType() == df.item_type.SEEDS and
        same_xyz(pos, item.pos) then

            print(item.mat_type)
            print(item.mat_index)

        count = count + 1
    end
end

print(("Found %d seeds at cursor"):format(count))