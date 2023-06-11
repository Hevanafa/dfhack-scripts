-- Combine plants at cursor
-- By Hevanafa, 10-06-2023

local cursor = df.global.cursor

assert(cursor, "(l)ook mode is required")

local counts = {}
local first_refs = {}
local registered = {}

for _, item in pairs(df.global.world.items.all) do
    if item:getType() == df.item_type.PLANT and
        same_xyz(cursor, item.pos) then

        print(("%d: %d"):format(item.mat_index, item.stack_size))

        if counts[item.mat_index] == nil then
            counts[item.mat_index] = item.stack_size
            first_refs[item.mat_index] = item.id
        else
            counts[item.mat_index] = counts[item.mat_index] + item.stack_size
        end

        table.insert(registered, item)
    end
end


for _, item in pairs(first_refs) do
    item.stack_size = counts[item.mat_index]
end

-- Delete items that aren't first ref
for _, item in pairs(registered) do
    for _, ref in pairs(first_refs) do
        if item.id == ref.id then
            goto safe
        end
    end

    dfhack.items.remove(
        df.item.find(item.id)
    )

::safe::

end