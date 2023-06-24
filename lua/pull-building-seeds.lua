-- Declutter seeds from workshops (e.g. querns, millstones & farmer's workshop)
-- By Hevanafa, 22-06-2023
-- Based on build-now.lua > disconnect_clutter

local count = 0

for _, item in pairs(df.global.world.items.all) do
	if item:getType() == df.item_type.SEEDS then
	-- if item:getType() == df.item_type.CORPSEPIECE then
		local building = dfhack.items.getHolderBuilding(item)
		if not building then goto next end

		local found = false
		for k, contained_item in pairs(building.contained_items) do
			if contained_item.item == item then
				building.contained_items:erase(k)
				found = true
				break
			end
		end

		if not found then
			dfhack.printerr(("Failed to find clutter item: %d"):format(item.id))
			goto next
		end

		for idx, ref in ipairs(item.general_refs) do
			if ref:getType() == df.general_ref_type.BUILDING_HOLDER then
				item.general_refs:erase(idx)
				item:moveToGround(item.pos.x, item.pos.y, item.pos.z)

				count = count + 1
				goto next
			end
		end
	end

::next::

end

print(("Moved %d item(s)"):format(count))
