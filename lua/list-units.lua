-- list units by race, similar to "exterminate" script
-- By Hevanafa, 10-06-2023

local races = {}

for _, unit in pairs(df.global.world.units.all) do
    local race_name = dfhack.units.getRaceName(unit)
    races[race_name] = (races[race_name] or 0) + 1
end

local race_names = {}
for race_name, _ in pairs(races) do
    table.insert(race_names, race_name)
end
table.sort(race_names)

if #race_names == 0 then
    print("There are no creatures in this world.")
    return
end

for _, race_name in pairs(race_names) do
    print(("%s: %d"):format(race_name, races[race_name]))
end

