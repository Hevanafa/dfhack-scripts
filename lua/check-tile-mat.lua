-- 18-06-2023

local tile_material = require "tile-material"

local cur = copyall(df.global.cursor)

assert(cur, "(l)ook mode is required!")

local tile = dfhack.maps.getTileType(cur)
-- see class MapBlock
local block = dfhack.maps.getTileBlock(cur)
print(block.occupancy)
print(block.temperature_1)
print(block.temperature_2)
-- print(df.tile[tile])
-- print(block.tiletype[cur.x % 16][cur.y % 16])
-- print(df.tiletype.attrs[block.tiletype[cur.x % 16][cur.y % 16]].material)

-- this returns matinfo
local layer_mat = tile_material.GetLayerMat(cur.x, cur.y, cur.z)
print(layer_mat)
-- print(layer_mat.reaction_class)
