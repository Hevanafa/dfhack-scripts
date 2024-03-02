--- [[
-- Write something to stone slabs that are on the ground.
-- ]]

-- By Hevanafa, 02-03-2024

local cursor = copyall(df.global.cursor)

local new_desc = "Your description here."
-- local new_engraving_type = 18

assert(cursor, "(l)ook mode is required!")

for _, item in pairs(df.global.world.items.all) do
    if same_xyz(cursor, item.pos) and
        item:getType() == df.item_type.SLAB and
        item.flags.on_ground then
        -- print(item:getType(), item:getSubtype(), item.mat_type, item.mat_index)
        -- print(item:getSlabEngravingType())

		item.description = new_desc
        item.engraving_type = new_engraving_type or -1

        print(("Description: \"%s\""):format(item.description))
        print(("Topic: %d"):format(item.topic))
        print(("Engraving type: %d"):format(item.engraving_type))
		return
    end
end
