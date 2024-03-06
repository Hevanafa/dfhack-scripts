-- Gather webs within range (inclusive).
-- 06-03-2024

local player = df.global.world.units.active[0]

local max_dist = 3

-- the same Z level
function get_dist(a, b)
	return math.abs(a.pos.x - b.pos.x) + 
		math.abs(a.pos.y - b.pos.y)
end

-- webs have THREAD item type
-- giant brown recluse spider web: 157
-- type: class Item
for _, item in pairs(df.global.world.items.all) do
    if item:getType() == df.item_type.THREAD and
    	item.flags.on_ground and
		get_dist(player, item) <= max_dist and
		item.flags.spider_web then

		item.flags.spider_web = false
    end
end

-- for _, item in pairs(df.global.world.items.all) do
--     if item:getType() == df.item_type.THREAD and
--     	item.flags.on_ground and
-- 		get_dist(player, item) <= 1 and
-- 		item.flags.spider_web then  -- not item:isCollected()

--         local item_type = item:getType()
-- 		print(item.flags.spider_web)
-- 		item.flags.spider_web = false

--         -- print(item.id, pos2xyz(item.pos))
--         print(df.item_type[item_type])
-- 		-- print(item:getSubtype())  -- -1
-- 		print(item:getMaterial())
-- 		print(item:getMaterialIndex())
-- 		-- print(item:getRace())  -- the same as material index
-- 		-- print(item:getActualMaterial())
-- 		-- print(item:getActualMaterialIndex())
-- 		-- print(item:isProcessableThread())  -- both webs & real thread return false
-- 		-- print(item:isCollected())  -- only webs return false
-- 		-- print(item:getCaste())
--     end
-- end