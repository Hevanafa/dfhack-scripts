-- 18-06-2023

local tile_material = require "tile-material"

local cur = copyall(df.global.cursor)
local unit = df.global.world.units.active[0]

assert(cur, "(l)ook mode is required!")

local tile = dfhack.maps.getTileType(cur)
print(tile)
local block = dfhack.maps.getTileBlock(cur)
print(block)
local tiletype = block.tiletype[cur.x % 16][cur.y % 16]
print(tiletype)

-- this returns matinfo, see Lua API for more info
local matinfo = tile_material.GetLayerMat(cur.x, cur.y, cur.z)
print(matinfo)
-- print(layer_mat.reaction_class)
-- print(layer_matinfo.id)
-- print(layer_matinfo.stone_name)
print(matinfo.type)
print(matinfo.index)

local new_item = df.item.find(
    dfhack.items.createItem(
        df.item_type.BOULDER, -1,
        matinfo.type, matinfo.index,
        unit
    )
)

assert(new_item, "Failed to create item")

new_item.stack_size = 10

