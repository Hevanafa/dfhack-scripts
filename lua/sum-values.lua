-- Sum item values on the ground (not including items in the container).
-- By Hevanafa, 03-03-2024

local help = [====[
Sum item values on the ground using dfhack.items.getValue(item) function.
]====]

function contains(t, item)
    for _, v in pairs(t) do
        if v == item then return true end
    end
    return false
end

local args = {...}
if contains(args, "help") or contains(args, "?") then
    print(help)
    return
end

local cursor = copyall(df.global.cursor)

assert(cursor, "(l)ook mode is required!")

local sum = 0

-- ItemCrafted < ItemActual
-- item.mat_type, item.mat_index

for _, item in pairs(df.global.world.items.all) do
    if same_xyz(cursor, item.pos) and
        item.flags.on_ground then

        sum = sum + dfhack.items.getValue(item)
    end
end

print(sum)
