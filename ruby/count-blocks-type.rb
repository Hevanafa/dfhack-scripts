# key: mat_type mat_index
# value: item.pos
typeCounts = {}

df.world.items.all.each{ |item|
    if item.getType().to_s == "BLOCKS" then
        # key = "%d %d" % [item.getMaterial(), item.getMaterialIndex()]
        key = item.getMaterialIndex().to_s

        if (!typeCounts[key]) then
            typeCounts[key] = 0
        end

        typeCounts[key] += 1
    end
}

typeCounts.to_a.sort_by!{ |item| item[0].to_i }.each{ |pair|
    puts pair * ": "
}
