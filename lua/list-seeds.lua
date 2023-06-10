for _, item in pairs(df.global.world.items.all) do
    if item.pos.x ~= -30000 and
        item:getType() == df.item_type.SEEDS then
            
        print(("%d %d %d"):format(
            item.pos.x, item.pos.y, item.pos.z
        ))
    end
end