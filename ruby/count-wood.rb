count = 0
df.world.items.all.each{ |item|
    if item.class.to_s == "DFHack::ItemWoodst" then
        count += 1
    end
}

puts "There are %d wood logs in total" % count