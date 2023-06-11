-- Combine plants at cursor
-- By Hevanafa, 10-06-2023

local cursor = df.global.cursor

assert(cursor, "(l)ook mode is required")

local counts = {}
local first_refs = {}
local registered = {}

for _, item in pairs(df.global.world.items.all) do
    if item:getType() == df.item_type.PLANT and
        not item.flags.in_inventory and
        same_xyz(cursor, item.pos) then

        local item_id = item.id

        print(("%d: %d"):format(item.mat_index, item.stack_size))

        if counts[item.mat_index] == nil then
            counts[item.mat_index] = item.stack_size
            first_refs[item.mat_index] = item_id
        else
            counts[item.mat_index] = counts[item.mat_index] + item.stack_size
        end

        table.insert(registered, item_id)
    end
end


for _, item_id in pairs(first_refs) do
    local item = df.item.find(item_id)
    item.stack_size = counts[item.mat_index]
end

for k, v in pairs(first_refs) do
    print(k, v)
end

-- Delete items that aren't first ref
for _, item_id in pairs(registered) do
    for k, ref_id in pairs(first_refs) do
        if item_id == ref_id then
            goto safe
        end
    end

    dfhack.items.remove(
        df.item.find(item_id)
    )

::safe::

end