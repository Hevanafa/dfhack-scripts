local mat_info = dfhack.matinfo.find("PLANT:HEMP:STRUCTURAL")
print(mat_info)
-- found from create-item.lua
print(mat_info.index)

-- do return end

local player_unit = df.global.world.units.active[0]
assert(player_unit, "Can't find player unit!")

for _, plant in pairs(df.global.world.plants.all) do
	if plant.tree_info == nil and
		not plant.damage_flags.is_dead and
		plant.material == mat_info.index then
		-- print(v)
		-- always ends with :STRUCTURAL but is a number
		-- print(plant.material)

		-- found in tile-material.lua
		-- print(dfhack.matinfo.decode(419, plant.material))

		-- See Material info lookup in "Lua API.rst.txt"
		-- print(dfhack.matinfo.find(plant.material))
		-- dfhack.matinfo.find("INORGANIC:IRON").material

		-- use GetShrubMat(x, y, z) to get the plant material at cursor

		-- stl_vector is based off of class StlVector32
		-- it's not possible to delete a plant I guess
		local new_item = df.item.find(
			dfhack.items.createItem(
				df.item_type.PLANT, -1,
				419, plant.material, player_unit
			)
		)

		new_item.pos = xyz2pos(pos2xyz(plant.pos))

		new_item.stack_size = 1 + math.random(0, 2)
	end
end