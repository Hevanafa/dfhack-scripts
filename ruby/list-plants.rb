idx = -1

df.world.raws.plants.all.each{ |plant|
    idx += 1
    puts "%d: %s" % [idx, plant.id.to_s]
}