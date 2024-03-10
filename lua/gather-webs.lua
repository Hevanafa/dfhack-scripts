-- 10-03-2024

local function get_dist(pos_a, pos_b)
    return math.abs(pos_b.x - pos_a.x) +
        math.abs(pos_b.y - pos_a.y) +
        math.abs(pos_b.z - pos_a.z)
end

local player = df.global.world.units.active[0]

-- print(player.pos)

local count = 0

for _, item in pairs(df.global.world.items.all) do
    if item:getType() == df.item_type.THREAD and
        item.flags.spider_web and
        get_dist(player.pos, item.pos) <= 2 then

        item.flags.spider_web = false
        count = count + 1
    end
end

if count > 0 then
    print(("Changed %d webs into thread."):format(count))
end