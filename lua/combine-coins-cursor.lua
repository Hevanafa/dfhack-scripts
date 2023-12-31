-- for k, v in pairs(df.item_type) do
--     print(("%s: %s"):format(k, v))
-- end
-- print(df.item_type.COIN)
-- do return end

-- 10-06-2023

local cursor = df.global.cursor
assert(cursor, "(l)ook mode is required!")

local counts = {}
local first_refs = {}
local registered = {}

for _, item in pairs(df.global.world.items.all) do
	if item:getType() == df.item_type.COIN and
		not item.flags.in_inventory and
		same_xyz(cursor, item.pos) then

		local item_id = item.id

		-- print(item.mat_index, item.coin_batch)

		local key = ("%d %d"):format(item.mat_index, item.coin_batch)

		if counts[key] == nil then
			first_refs[key] = item_id
			counts[key] = item.stack_size
		else
			counts[key] = (counts[key] or 0) + item.stack_size
		end

		table.insert(registered, item_id)
	end
end

for _, item_id in pairs(first_refs) do
	local item = df.item.find(item_id)
	local key = ("%d %d"):format(item.mat_index, item.coin_batch)
	print(key, counts[key])
	item.stack_size = counts[key]
	item:calculateWeight()
end

-- Remove items that aren't the first
for _, item_id in pairs(registered) do
	for _, ref_id in pairs(first_refs) do
		if item_id == ref_id then
			goto safe
		end
	end

	dfhack.items.remove(
		df.item.find(item_id)
	)

::safe::
end
