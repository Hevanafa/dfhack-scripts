local unit = df.global.world.units.active[0]

for _, v in pairs(unit.owned_items) do
	print(v)
end

-- print(unit.owned_items)
