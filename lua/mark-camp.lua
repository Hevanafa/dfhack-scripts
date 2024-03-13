-- By Hevanafa, 17-06-2023
-- Updated 10-03-2024
--
-- Based off of the script advfort.lua and in-site.lua

-- Set the new site type
local new_type = df.world_site_type.Camp

local map = df.global.world.map
local unit = df.global.world.units.active[0]

local tx, ty = math.floor(map.region_x + unit.pos.x / 48), math.floor(map.region_y + unit.pos.y / 48)

-- local tx,ty=advGlobalPos()

-- Important: if you want to set the site type to Town, this chunk will reset.
-- Known safe types to keep stuff: PlayerFortress, Camp, ImportantLocation

for k, site in pairs(df.global.world.world_data.sites) do
    local tp={site.pos.x, site.pos.y}
    
    if tp[1] * 16 + site.rgn_min_x <= tx and tx <= tp[1] * 16 + site.rgn_max_x and
        tp[2] * 16 + site.rgn_min_y <= ty and ty <= tp[2] * 16 + site.rgn_max_y then

        local translated = dfhack.TranslateName(site.name)
        print(("Site: %s"):format(#translated > 0 and translated or "(Unnamed site)"))
        -- print("Type: " .. site.type)
        site.type = new_type
        -- print("New site type: " .. site.type)
        print(("Marked this site as %s."):format(df.world_site_type[new_type]))
        return
    end
end

print("Not in a site.")
