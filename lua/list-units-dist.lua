-- get the nearest unit's race
-- by Hevanafa, 10-06-2023

local cur = copyall(df.global.cursor)
if cur.x == -30000 then
    return
end

local nearest_race
local nearest = 10000

print("UNIT_RACE | distance from cursor")

for _, unit in pairs(df.global.world.units.all) do
    local race_name = dfhack.units.getRaceName(unit)
    local pos = copyall(unit.pos)
    local dist = math.sqrt((cur.x - pos.x) ^ 2 + (cur.y - pos.y) ^ 2 + (cur.z - pos.z) ^ 2)
    print(("%s | %.2f"):format(race_name, dist))

    if nearest > dist then
        nearest = dist
        nearest_race = race_name
    end
end

if nearest_race then
    print(("Nearest unit: %s (%.2f blocks away)"):format(nearest_race, nearest))
end