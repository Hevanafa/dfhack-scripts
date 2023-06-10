local mat_info = dfhack.matinfo.find("PLANT:HEMP:STRUCTURAL")
print(mat_info)
-- found from create-item.lua
print(mat_info.index)

-- do return end

local player_unit = df.global.world.units.active[0]
assert(player_unit, "Can't find player unit!")

-- see class Tiletype < MemHack::Enum
-- :ShrubDead
local dead_shrub_tile_type = 389

local dead_count = 0
local plant_count = 0
local count = 0

for _, plant in pairs(df.global.world.plants.all) do
	local tile_type = dfhack.maps.getTileType(plant.pos)

	if plant.tree_info == nil and
		plant.material == mat_info.index then

		if tile_type ~= dead_shrub_tile_type then
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

			plant_count = plant_count + 1
			count = count + new_item.stack_size
		else
			dead_count = dead_count + 1
		end
	end
end

print(("Grown %d hemp plants from %d blocks"):format(count, plant_count))
if dead_count > 0 then
	print(("%d dead plants were skipped"):format(dead_count))
end