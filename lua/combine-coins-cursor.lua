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
		same_xyz(cursor, item.pos) then

		-- print(item.mat_index, item.coin_batch)

		local key = ("%d %d"):format(item.mat_index, item.coin_batch)

		if counts[key] == nil then
			first_refs[key] = item.id
			counts[key] = item.stack_size
		else
			counts[key] = (counts[key] or 0) + item.stack_size
		end

		table.insert(registered, item)
	end
end

for _, item in pairs(first_refs) do
	local key = ("%d %d"):format(item.mat_index, item.coin_batch)
	print(key, counts[key])
	item.stack_size = counts[key]
end

-- Remove items that aren't the first
for _, item in pairs(registered) do
	for _, ref in pairs(first_refs) do
		if item.id == ref.id then
			goto safe
		end
	end

	dfhack.items.remove(
		df.item.find(item.id)
	)

::safe::
end
