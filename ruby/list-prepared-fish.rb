# puts df.cursor.x

# if df.cursor.x == -30000 then
#     puts "look mode is required"
#     throw :script_finished
# end

puts "Counting fish items..."

count = 0

df.world.items.all.each{ |item|
    # puts item.class.name
    if item.instance_of? DFHack::ItemFishst then 
        # puts item.flags._whole
        # if item.flags.on_ground then
        # if item.flags.container then
        # if item.flags.in_chest then
        if item.flags.in_inventory then
            count += item.stack_size
        end
    end
}

puts "fish count:", count