# ItemSeedsst < ItemActual < Item < MemHack::Compound
# Done: convert seeds to plants
# Todo: set item material to its structural type

$baseStruct = DFHack::ItemPlantst

def createPlant(itemRef)
    item = $baseStruct.cpp_new
    item.id = df.item_next_id
    item.stack_size = 1 + rand(6) # yield 1 to 6

    item.mat_type = itemRef.mat_type
    item.mat_index = itemRef.mat_index

    df.item_next_id += 1
    item.categorize(true)
    df.world.items.all << item

    item.pos = itemRef.pos
    item.flags.on_ground = true

    df.map_tile_at(item.pos).mapblock.items << item.id
    df.map_tile_at(item.pos).occupancy.item = true
end


df.world.items.all.each{ |item|
    if item.getType().to_s == "SEEDS" then
        # puts item.getMaterialIndex()
        createPlant(item)
        item.pos.x = item.pos.y = item.pos.z = -30000
    end
    # puts item.class.to_s
}