count = 0
hiddenCount = 0

df.world.items.all.each{ |item|
    if item.pos.x == df.cursor.x &&
        item.pos.y == df.cursor.y &&
        item.pos.z == df.cursor.z then

        count += 1

        if item.flags.hidden then
            hiddenCount += 1
        end
    end
}

puts "Found %d items (%d hidden) at %d %d %d" % [
    count,
    hiddenCount,
    df.cursor.x,
    df.cursor.y,
    df.cursor.z
]
