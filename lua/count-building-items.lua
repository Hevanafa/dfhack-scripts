local count = 0
for _, item in pairs(df.global.world.items.all) do
	count = count + (item.flags.in_building and 1 or 0)
end

print(count)