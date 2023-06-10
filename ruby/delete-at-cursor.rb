puts "This script will bug the game as the item is just removed from the vector."
throw :script_finished

df.world.items.all.each_with_index{ |item, idx|
    # delete_at
    if item.pos.x == df.cursor.x &&
        item.pos.y == df.cursor.y &&
        item.pos.z == df.cursor.z then

        if item.instance_of? DFHack::ItemSeedsst then
            df.world.items.all.delete_at(idx)
        end
    end
}
