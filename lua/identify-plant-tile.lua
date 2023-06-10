-- By Hevanafa, 08-06-2023
-- file:///D:/df_47_05_win_b/hack/docs/docs/api/Maps.html?highlight=map+block

local pos = copyall(df.global.cursor)
local x, y, z = pos2xyz(pos)

-- local block = dfhack.maps.getTileBlock(pos)
local tile_type = dfhack.maps.getTileType(pos)
-- print(tile_type)

-- do return end

local plant = dfhack.maps.getPlantAtTile(x, y, z)

if not plant then
	qerror("no plants at cursor")
end

-- see ruby-autogen-win.rb: class Plant
-- dead_shrub_tile?
print(plant)
print(("Tile type: %d"):format(tile_type))
print(("Material: %d"):format(plant.material))
print(("Hitpoints: %d"):format(plant.hitpoints))
print(("Grow counter: %d"):format(plant.grow_counter))
print(("Damage flags: %s %s %s"):format(
	plant.damage_flags.is_burning,
	plant.damage_flags.is_drowning,
	plant.damage_flags.is_dead
))
