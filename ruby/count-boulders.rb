# key: position: x y z
# value: item.pos
posCounts = {}

df.world.items.all.each{ |item|
    if item.getType().to_s == "BOULDER" then
        key = "%d %d %d" % [item.pos.x, item.pos.y, item.pos.z]

        if (!posCounts[key]) then
            posCounts[key] = 0
        end

        posCounts[key] += 1
    end
}

posCounts.each{ |key, count|
    puts key + ": " + count.to_s
}
