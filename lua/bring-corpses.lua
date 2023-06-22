--226-06-2023

local unit = df.global.world.units.active[0]
local target = unit.pos

local count = 0

for _, item in pairs(df.global.world.items.all) do
    if item.pos.x ~= -30000 and
        (item:getType() == df.item_type.CORPSE or
        item:getType() == df.item_type.CORPSEPIECE or
        item:getType() == df.item_type.MEAT or
        item:getType() == df.item_type.GLOB) and
        item.flags.on_ground and
        not item.flags.in_inventory and
        not item.flags.in_chest and
        not item.flags.spider_web then

        dfhack.items.moveToGround(item, target)
        count = count + 1
    end
end

print(("Moved %d items."):format(count))
