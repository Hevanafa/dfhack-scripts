# 08-06-2023
# By Hevanafa
# Count fish in barrels

count = 0

df.world.items.all.each_with_index{ |item, idx|
    if item.instance_of?(DFHack::ItemFishRawst) &&
        item.flags.in_inventory then
        # item.pos.x != -30000 then

        puts idx
        puts "  race: %d, caste: %d, stack_size: %d" % [item.race, item.caste, item.stack_size]
        count += item.stack_size
        puts "  pos: %d, %d, %d" % [item.pos.x, item.pos.y, item.pos.z]
    end
}

puts "Raw fish count: %d" % [count]