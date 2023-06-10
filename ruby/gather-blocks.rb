if df.cursor.x == -30000 then
    puts "Place your cursor somewhere"
    throw :script_finished
end

limit = 100
count = 0

df.world.items.all.each{ |item|
    next unless df.item_isfree(item)
    
    if item.getType().to_s == "BLOCKS" &&
        count < limit then

        next unless df.item_isfree(item)

        count += 1

        item.pos = df.cursor
        item.flags.on_ground = true

        tileAtCursor = df.map_tile_at()
        tileAtCursor.mapblock.items << item.id
        tileAtCursor.occupancy.item = true
    end
}

puts "Moved %d blocks to %d %d %d" % [
    count,
    df.cursor.x,
    df.cursor.y,
    df.cursor.z
]
