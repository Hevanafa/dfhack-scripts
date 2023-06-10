count = 0

df.world.items.all.each{ |item|
    if item.pos.x == df.cursor.x &&
        item.pos.y == df.cursor.y &&
        item.pos.z == df.cursor.z then

        count += 1
    end
}

puts "Found %d items at %d %d %d" % [
    count,
    df.cursor.x,
    df.cursor.y,
    df.cursor.z
]
