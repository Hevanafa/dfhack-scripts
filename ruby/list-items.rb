# df.map_tile_at.mapblock.items.each{ |item|
#     puts item.to_s
# }

puts "Items at %d %d %d:" % [df.cursor.x, df.cursor.y, df.cursor.z]

df.world.items.all.each{ |item|
    if df.cursor.x == item.pos.x &&
        df.cursor.y == item.pos.y &&
        df.cursor.z == item.pos.z then

        className = item.class.to_s
        typeName = item.getType().to_s

        puts "%d: %s (%s)" % [item.id, className, typeName]

        # Fail: item is not a hash
        # item.each{ |key, value|
        #     puts "%s: %s" % [key.to_s, value.to_s]
        # }

        # puts "mat_type: %d\nmat_index: %d\n\n" % [item.mat_type, item.mat_index]

        # Fail: can't access item object like this
        # if className == "DFHack::ItemWoodst" then
        #     puts item[:mat_type].to_s
        # end
    end
}