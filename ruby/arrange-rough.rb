# modified arrange-boulders.rb

if df.cursor.x == -30000 then
    puts "Put your cursor somewhere"
    throw :script_finished
end

# key: position: x y z
# value: mat_type
# posCounts = {}
typeCounts = {}

df.world.items.all.each{ |item|
    next unless df.item_isfree(item)

    if item.getType().to_s == "ROUGH" then
        # && item.pos.z < 100
        
        key = item.getMaterialIndex().to_s

        if (!typeCounts[key]) then
            typeCounts[key] = 0
        end

        typeCounts[key] += 1
    end
}

typeCounts.each{ |key, count|
    puts key + ": " + count.to_s
}

# begin arrangement
types = typeCounts.to_a.map{|pair|
    pair[0]
}

count = 0

df.world.items.all.each{ |item|
    next unless df.item_isfree(item)

    if item.getType().to_s == "ROUGH" then
        # && item.pos.z < 100

        idx = types.index(
            item.getMaterialIndex().to_s
        )

        x = df.cursor.x + idx % 5
        y = df.cursor.y + idx / 5

        item.pos.x = x
        item.pos.y = y
        item.pos.z = df.cursor.z

        # to fix item disappearance
        item.flags.on_ground = true

        # map tile at cursor
        mapTile = df.map_tile_at(x, y, df.cursor.z)
        mapTile.mapblock.items << item.id
        mapTile.occupancy.item = true

        count += 1
    end
}

puts "Moved %d rough gems" % count