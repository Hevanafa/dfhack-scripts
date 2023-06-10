if df.cursor.x == -30000 then
    puts "Place your cursor somewhere"
end

df.world.items.all.each{ |item|
    next unless df.item_isfree(item)
    
    if item.getType().to_s == "SEEDS" then
        item.pos = df.cursor
        item.flags.on_ground = true

        df.map_tile_at.mapblock.items << item.id
        df.map_tile_at.occupancy.item = true
    end
}