-- By Hevanafa, 17-06-2023
--
-- Based off of the script mark-camp.lua

local map = df.global.world.map
local unit = df.global.world.units.active[0]

local tx, ty = math.floor(map.region_x + unit.pos.x / 48), math.floor(map.region_y + unit.pos.y / 48)

for k, site in pairs(df.global.world.world_data.sites) do
    local tp={site.pos.x, site.pos.y}
    
    if tp[1] * 16 + site.rgn_min_x <= tx and tx <= tp[1] * 16 + site.rgn_max_x and
        tp[2] * 16 + site.rgn_min_y <= ty and ty <= tp[2] * 16 + site.rgn_max_y then

        local translated = dfhack.TranslateName(site.name)
        print(("Site: %s"):format(#translated > 0 and translated or "(Unnamed site)"))
        print("Type: " .. site.type)
        print(("Civ ID: %d"):format(site.civ_id))
        print(("Current owner ID: %d"):format(site.cur_owner_id))
        print(site.property_ownership)
        print(site.realization)
        if site.realization then
            local props = site.realization

            print(props.num_buildings)

            print(props.mini_tiles[0][0])
        end

        return
    end
end

print("Not in a site.")
