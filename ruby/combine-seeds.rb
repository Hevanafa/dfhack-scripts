df.world.items.all.each{ |item|
    if item.pos.x == df.cursor.x &&
        item.pos.y == df.cursor.y &&
        item.pos.z == df.cursor.z then

        if item.instance_of? DFHack::ItemSeedsst then
            item.stack_size = 1
            puts "type: %d, index: %d" % [item.mat_type, item.mat_index]
        end
    end
}
