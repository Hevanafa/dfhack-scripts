local cur = copyall(df.global.cursor)

assert(cur, "(l)ook mode is required!")

local count = 0

for _, item in pairs(df.global.world.items.all) do
	if item:getType() == df.item_type.CORPSEPIECE and
	-- if item:getType() == df.item_type.SEEDS and
		item.flags.on_ground and
		dfhack.items.getHolderBuilding(item) == nil then

		item:moveToGround(cur.x, cur.y, cur.z)

		count = count + 1
	end

	::next::
end

print(("Dumped %d item(s)"):format(count))