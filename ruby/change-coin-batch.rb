# 08-06-2023

if $script_args.size == 0 || !$script_args[0] then
    puts "batch is required"
    puts "better use check-coin-batch before calling this"
    throw :script_finished
end

new_batch = $script_args[0].to_i

df.world.items.all.each{ |item|
    if item.pos.x == df.cursor.x &&
        item.pos.y == df.cursor.y &&
        item.pos.z == df.cursor.z then

        if item.instance_of? DFHack::ItemCoinst then
            puts "batch: %d" % [item.coin_batch]
            item.coin_batch = new_batch
        end
    end
}
