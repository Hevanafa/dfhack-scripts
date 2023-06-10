df.world.raws.plants.all.each{ |plantRaw|
    puts "%s (%d)" % [plantRaw.id, plantRaw.index]
    
    # throw :script_finished
}