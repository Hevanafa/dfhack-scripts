# puts df.cursor.x

# if df.cursor.x == -30000 then
#     puts "look mode is required"
#     throw :script_finished
# end

puts "Counting raw fish..."

count = 0

df.world.items.all.each{ |item|
    # puts item.class.name
    if item.instance_of? DFHack::ItemFishRawst then 
        # puts item.flags._whole

        count += item.stack_size
    end
}

puts "raw fish count:", count