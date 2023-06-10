# WorldRaws < MemHack::Compound
# InorganicRaw < MemHack::Compound

# df.world.raws.inorganics.all.each { |inorganic|
#     puts inorganic.id
# }

# inorganic.class.to_s
metals = inorganic.metal_ore.mat_index.map{ |idx|
    df.world.raws.inorganics[idx]
}

throw :script_finished

df.world.raws.inorganics.find_all{ |inorganic|
    # puts inorganic.class.to_s
    puts inorganic.id
    # puts inorganic.metal_ore != nil
    metals = inorganic.metal_ore.mat_index.map{ |idx|
        df.world.raws.inorganics[idx]
    }
    puts ""
    throw :script_finished

    # metal = inorganic.flags[:METAL_ORE]
    # soil = inorganic.flags[:SOIL]

    # puts "%s %s %s" % [inorganic.id, metal ? "(metal)" : "", soil ? "(soil)" : ""]
    # throw :script_finished
}