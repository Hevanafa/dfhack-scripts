$baseStruct = DFHack::ItemGemst
rawMaterial = "INORGANIC:DIAMOND_CLEAR"

if df.cursor.x == -30000 then
    throw :script_finished
end

puts rawMaterial
$material = df.decode_mat(rawMaterial)

# x, y & z: position relative to df.cursor
def createDiamond(x, y, z)
    newX, newY, newZ = df.cursor.x + x, df.cursor.y + y, df.cursor.z + z

    mapTile = df.map_tile_at(newX, newY, newZ)
    return if mapTile == nil || !mapTile.shape_passablehigh

    item = $baseStruct.cpp_new
    item.id = df.item_next_id
    item.mat_type = $material.mat_type
    item.mat_index = $material.mat_index

    df.item_next_id += 1
    item.categorize(true)
    df.world.items.all << item

    item.pos = df.cursor
    item.pos.x = newX
    item.pos.y = newY
    item.pos.z = newZ

    item.flags.on_ground = true

    df.map_tile_at.mapblock.items << item.id
    df.map_tile_at.occupancy.item = true
end

(-10..10).each{|y|
(-10..10).each{|x|
    createDiamond(x, y, 0)
}
}

