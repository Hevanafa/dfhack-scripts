# InorganicRaw
# Material < MaterialCommon < MemHack::Compound

if df.cursor.x == -30000 then
    throw :script_finished
end

count = 0

$metalOres = []

idx = -1
df.world.raws.inorganics.find_all{ |inorganic|
    idx += 1
    $metalOres << idx if inorganic.flags[:METAL_ORE]
}

def isMetalOre(matIndex)
    return $metalOres.include?(matIndex)
end

df.world.items.all.each{ |item|
    
    if item.getType().to_s == "BOULDER" &&
        isMetalOre(item.getMaterialIndex()) then

        next unless df.item_isfree(item)
        
        item.pos.x = df.cursor.x
        item.pos.y = df.cursor.y
        item.pos.z = df.cursor.z

        item.flags.on_ground = true

        df.map_tile_at().mapblock.items << item.id
        df.map_tile_at().occupancy.item = true

        count += 1
    end
}

puts "Moved %d boulders" % count