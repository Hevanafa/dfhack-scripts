local plantCounts = {}
local plantRefs = {}

for _, item in pairs(df.global.world.items.all) do
    if item:getType() == df.item_type.PLANT then
        local key = ("%d %d"):format(
            item:getMaterial(),
            item:getMaterialIndex()
        )
        local count = item.stack_size

        print(("%s [%d]"):format(key, count))

        if plantCounts[key] == nil then
            plantCounts[key] = 0
        end

        if plantRefs[key] == nil then
            plantRefs[key] = item
        end

        plantCounts[key] = plantCounts[key] + count
    end
    -- table.insert(itemTypes, ("%d %d"):format(item:get))
end

print("Counting result")
for key, count in pairs(plantCounts) do
    print(("%s [%d]"):format(key, count))

    plantRefs[key].stack_size = plantCounts[key]
end


for _, item in pairs(df.global.world.items.all) do
    if item:getType() == df.item_type.PLANT then
        local found = false

        for __, ref in pairs(plantRefs) do
            if item == ref then
                found = true
            end
        end

        if not found then
            dfhack.items.remove(
                df.item.find(item.id)
            )
        end
    end
end