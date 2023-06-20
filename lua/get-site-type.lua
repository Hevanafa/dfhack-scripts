-- By Hevanafa, 20-06-2023
--
-- Based off of the script advfort.lua and in-site.lua

local map = df.global.world.map
local unit = df.global.world.units.active[0]

local tx, ty = math.floor(map.region_x + unit.pos.x / 48), math.floor(map.region_y + unit.pos.y / 48)

for k, site in pairs(df.global.world.world_data.sites) do
    local tp={site.pos.x, site.pos.y}
    if tx >= tp[1]*16+site.rgn_min_x and tx <= tp[1]*16+site.rgn_max_x and
        ty >= tp[2]*16+site.rgn_min_y and ty <= tp[2]*16+site.rgn_max_y then

        local translated = dfhack.TranslateName(site.name)
        print(("Site: %s"):format(#translated > 0 and translated or "(Unnamed site)"))
        print(("Type: %d"):format(site.type))
        -- print("Type: " .. site.type)
        -- site.type = 9 -- CAMP
        -- print("New site type: " .. site.type)
        -- print("Marked this site as camp.")
        return
    end
end

print("Not in a site.")
