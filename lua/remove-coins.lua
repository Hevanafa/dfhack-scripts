-- call this after using heva/combine-coins

for _, item in pairs(df.global.world.items.all) do
    if item.pos.x == -30000 and
        item:getType() == df.item_type.COIN then
        -- print(item:getType())

        print(("%d is out of bounds"):format(item.id))

        dfhack.items.remove(
            df.item.find(item.id)
        )
    end

    -- print(item.id)
end
