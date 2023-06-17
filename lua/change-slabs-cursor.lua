-- By Hevanafa, 18-06-2023

local cursor = copyall(df.global.cursor)

assert(cursor, "(l)ook mode is required!")

for _, item in pairs(df.global.world.items.all) do
    if same_xyz(cursor, item.pos) and
        item:getType() == df.item_type.SLAB then
        -- print(item:getType(), item:getSubtype(), item.mat_type, item.mat_index)
        -- print(item:getSlabEngravingType())

        item.engraving_type = 4

        print(("Description: \"%s\""):format(item.description))
        print(("Topic: %d"):format(item.topic))
        print(("Engraving type: %d"):format(item.engraving_type))
    end
end
