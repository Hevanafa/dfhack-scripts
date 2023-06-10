$baseStruct = DFHack::ItemPlantst
rawMaterial = "PLANT:BERRIES_FISHER:STRUCTURAL"
puts rawMaterial
$material = df.decode_mat(rawMaterial)

def createBerry(x, y, z)
    item = $baseStruct.cpp_new
    item.id = df.item_next_id
    item.stack_size = 10
    item.mat_type = $material.mat_type
    item.mat_index = $material.mat_index

    df.item_next_id += 1
    item.categorize(true)
    df.world.items.all << item

    item.pos = df.cursor
    item.pos.x += x
    item.pos.y += y
    item.pos.z += z

    item.flags.on_ground = true

    df.map_tile_at.mapblock.items << item.id
    df.map_tile_at.occupancy.item = true
end

(1..5).each{ |y|
    (1..5).each{ |x|
        createBerry(x, y, 0)
    }
}