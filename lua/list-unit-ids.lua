-- list unit IDs, similar to "exterminate" script
-- By Hevanafa, 10-06-2023

for _, unit in pairs(df.global.world.units.all) do
    local race_name = dfhack.units.getRaceName(unit)
    local x, y, z = pos2xyz(unit.pos)
    print(("%s (%d): %d, %d, %d %s"):format(
        race_name,
        unit.id,
        x, y, z,
        dfhack.units.isAlive(unit) and "" or "(died)"))
end
