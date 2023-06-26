-- 18-06-2023
-- This script will bring all units (within 100 tiles distance) to the same Z-level as the player.

local player = df.global.world.units.active[0]
local count = 0

for _, unit in pairs(df.global.world.units.all) do
    local alive = dfhack.units.isAlive(unit)

    if not alive then goto next end

    local dist = (unit.pos.x - player.pos.x) ^ 2 +
        (unit.pos.y - player.pos.y) ^ 2 +
        (unit.pos.z - player.pos.z) ^ 2

    if unit ~= player and dist < 10000 then
        local dx, dy = math.random(-10, 10), math.random(-10, 10)
        unit.pos.x = player.pos.x + dx
        unit.pos.y = player.pos.y + dy
        unit.pos.z = player.pos.z

        count = count + 1
        print(unit)
    end

::next::
end

print(("Moved %d units"):format(count))
