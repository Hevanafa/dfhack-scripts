if df.cursor.x == -30000 then
    puts "Place your cursor somewhere"
end

# wholeFlags:
# Refer to ItemFlags
# the bits printed are from most significant to least significant

df.world.items.all.each{ |item|
    if item.pos.x == df.cursor.x &&
        item.pos.y == df.cursor.y &&
        item.pos.z == df.cursor.z then

        wholeFlags = [item.flags._whole]
            .pack("L")
            .unpack("L")[0]
            .to_s(2)
            .rjust(32, "0")
            .scan(/\d{4}/)
            .join(" ")
        
        puts "%d: %s" % [item.id, wholeFlags]
    end
}


# tile = df.map_tile_at()

# puts tile.mapblock.class.to_s
# puts tile.mapblock.items.class.to_s
# puts tile.mapblock.items.each{ |item_id|
#     puts item_id
#     # throw :script_finished
# }
