# 08-06-2023
# By Hevanafa
# Detailed coin information viewer

df.world.items.all.each_with_index{ |item, idx|
    if item.instance_of? DFHack::ItemCoinst then
        puts idx
        puts "  in_inventory? %s" % item.flags.in_inventory
        puts "  mat_type: %d, mat_index: %d, batch: %d, stack_size: %d" % [item.mat_type, item.mat_index, item.coin_batch, item.stack_size]
        puts "  pos: %d, %d, %d" % [item.pos.x, item.pos.y, item.pos.z]
    end
}
