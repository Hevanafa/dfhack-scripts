df.world.items.all.each{ |item|
    if item.pos.x == df.cursor.x &&
        item.pos.y == df.cursor.y &&
        item.pos.z == df.cursor.z then

        if item.instance_of? DFHack::ItemCoinst then
            puts "batch: %d" % [item.coin_batch]
        end
    end
}
