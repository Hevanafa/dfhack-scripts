-- By Hevanafa, 08-06-2023
-- file:///D:/df_47_05_win_b/hack/docs/docs/api/Maps.html?highlight=map+block

local x, y, z = pos2xyz(df.global.cursor)

-- local block = dfhack.maps.getTileBlock(pos)
local plant = dfhack.maps.getPlantAtTile(x, y, z)

if not plant then
	qerror("no plants at cursor")
end

-- see ruby-autogen-win.rb: class Plant
print(plant)
print(("Material: %d"):format(plant.material))
