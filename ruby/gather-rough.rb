# based on gather-boulders
if df.cursor.x == -30000 then
    puts "Place your cursor somewhere"
    throw :script_finished
end

count = 0
df.world.items.all.each{ |item|
    if item.getType().to_s == "ROUGH" &&
        item.pos.z < 135 then

        next unless df.item_isfree(item)

        count += 1

        item.pos = df.cursor

        tileAtCursor = df.map_tile_at()
        tileAtCursor.mapblock.items << item.id
        tileAtCursor.occupancy.item = true
    end
}

puts "Moved %d rough gems to %d %d %d" % [
    count,
    df.cursor.x,
    df.cursor.y,
    df.cursor.z
]
