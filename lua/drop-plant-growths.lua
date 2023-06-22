-- Drop plant growths from backpack
-- By Hevanafa, 22-06-2023
-- Particularly useful when gathering fruits from trees or shrubs

local unit = df.global.world.units.active[0]
local count = 0

for _, item in pairs(df.global.world.items.all) do
	if item:getType() == df.item_type.PLANT_GROWTH then
		local container = dfhack.items.getContainer(item)

		if container and container:getType() == df.item_type.BACKPACK then -- dfhack.items.getHolderUnit(item) == unit
				dfhack.items.moveToGround(item, unit.pos)
				count = count + 1
			end
		end
	end
end

print(("Moved %d items"):format(count));