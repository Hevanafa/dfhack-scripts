for _, item in pairs(df.global.world.items.all) do
    if item:getType() == df.item_type.TOOL and
        not item.flags.in_inventory then

        -- local item_type = item:getType()

        print(item.id, pos2xyz(item.pos))
        -- print(df.item_type[item_type])
    end
end