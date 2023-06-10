# key: mat_type mat_index
# value: item.pos
typeCounts = {}
typeRefs = {}

df.world.items.all.each{ |item|
    if item.getType().to_s == "BOULDER" then
        # key = "%d %d" % [item.getMaterial(), item.getMaterialIndex()]
        key = item.getMaterialIndex().to_s

        if (!typeCounts[key]) then
            typeCounts[key] = 0
        end

        typeCounts[key] += 1
        typeRefs[key] = item
    end
}

typeCounts.to_a.sort_by!{ |item| item[0].to_i }.each{ |pair|
    # isMetalOre = typeRefs[pair[0]]
        # .isMetalOre(pair[0].to_i)
    isMetalOre = typeRefs[pair[0]].isMetalOre(
        typeRefs[pair[0]].mat_index
    )

    puts "%s: %d %s" % [
        pair[0],
        pair[1],
        isMetalOre ? "(metal ore)" : ""]
}
