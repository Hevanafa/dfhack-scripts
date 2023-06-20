local cursor = copyall(df.global.cursor)

assert(cursor, "(l)ook mode is required!")

local count = 0

for _, item in pairs(df.global.world.items.all) do
    if same_xyz(cursor, item.pos) and
        item.wear > 0 and
        not item.flags.in_inventory then
        item:setWear(0)
        count = count + 1
    end
end

print(("Removed wear from %d items"):format(count))
