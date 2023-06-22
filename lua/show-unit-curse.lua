local unit = df.global.world.units.active[0]

-- print(unit.curse.name)
for _, v in pairs(unit.syndromes.active) do
	print(v)
end