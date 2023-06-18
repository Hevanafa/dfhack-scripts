-- 18-06-2023
-- This script will bring all units to the same Z-level as the player.
-- USE WITH CAUTION!

local player = df.global.world.units.active[0]

for _, unit in pairs(df.global.world.units.all) do
    if unit ~= player then
        local dx, dy = math.random(-10, 10), math.random(-10, 10)
        unit.pos.x = player.pos.x + dx
        unit.pos.y = player.pos.y + dy
        unit.pos.z = player.pos.z
        print(unit)
    end
end