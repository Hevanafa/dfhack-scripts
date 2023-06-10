local unit = df.global.world.units.active[0]
local x, y, z = pos2xyz(unit.pos)
print(("%d, %d, %d"):format(x, y, z))
