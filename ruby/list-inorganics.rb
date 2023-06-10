df.world.raws.inorganics.find_all{ |inorganic|
    # string[]
    metals = inorganic.metal_ore.mat_index.map{ |m|
        df.world.raws.inorganics[m]
    }

    puts inorganic.id

    if inorganic.flags[:METAL_ORE] then
        puts "is a metal ore"
    end

    if metals.size > 0 then
        puts "Ore of: " + metals.map{ |m| m.id } * ", "
    end

    puts ""
}