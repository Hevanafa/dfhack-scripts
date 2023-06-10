local count = 0

for _, item in pairs(df.global.world.items.all) do
    if item:getType() == df.item_type.SEEDS and
        item.pos.x == -30000 then

        count = count + 1

        dfhack.items.remove(
            df.item.find(item.id)
        )
    end
end

print(("Removed %d seeds"):format(count))