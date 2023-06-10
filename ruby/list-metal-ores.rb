# extended from list-inorganics.rb
idx = -1

df.world.raws.inorganics.find_all{ |inorganic|
    idx += 1

    # string[]
    metals = inorganic.metal_ore.mat_index.map{ |m|
        df.world.raws.inorganics[m]
    }

    next unless inorganic.flags[:METAL_ORE]

    puts idx
    puts inorganic.id

    if metals.size > 0 then
        puts "Ore of: " + metals.map{ |m| m.id } * ", "
    end

    puts ""
}