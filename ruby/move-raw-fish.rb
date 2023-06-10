# puts df.cursor.x

if df.cursor.x == -30000 then
    puts "look mode is required"
    throw :script_finished
end

count = 0

df.world.items.all.each{ |item|
    # puts item.class.name
    if item.instance_of? DFHack::ItemFishRawst then
        item.pos.x = df.cursor.x
        item.pos.y = df.cursor.y
        item.pos.z = df.cursor.z

        # puts item.stack_size
        count += item.stack_size
    end
}

puts "moved %d raw fish" % [count]
