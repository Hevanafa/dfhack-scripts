# key: position: x y z
# value: mat_type
# posCounts = {}
typeCounts = {}

df.world.items.all.each{ |item|
    if item.getType().to_s == "BOULDER" &&
        item.pos.z < 100 then
        # key = "%d %d %d" % [item.pos.x, item.pos.y, item.pos.z]
        key = item.getMaterialIndex().to_s

        if (!typeCounts[key]) then
            typeCounts[key] = 0
        end

        typeCounts[key] += 1
    end
}

typeCounts.each{ |key, count|
    puts key + ": " + count.to_s
}
