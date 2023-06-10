if df.cursor.x == -30000 then
    puts "place a cursor!"
    throw :script_finished
end

$baseStruct = DFHack::ItemPlantst
rawMaterial = "PLANT:HEMP:STRUCTURAL"

puts rawMaterial
$material = df.decode_mat(rawMaterial)

def createHemp(x, y, z)
    item = $baseStruct.cpp_new
    item.id = df.item_next_id
    item.stack_size = 4
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

(-2..2).each{ |y|
(-2..2).each{ |x|
    createHemp(x, y, 0)
}
}
