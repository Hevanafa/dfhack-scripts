count = 0

df.world.items.all.each{ |item|
    if item.getType().to_s == "SEEDS" then
        count += 1
    end
}

puts count
