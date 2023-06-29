-- By Hevanafa, 24-06-2023
--
-- Based off of the script `mark-camp.lua`

function print_min_max(site)
    print("Region:")
    print(("{%d, %d}-{%d, %d}"):format(
        site.rgn_min_x,
        site.rgn_min_y,
        site.rgn_max_x,
        site.rgn_max_y))

    print("Global:")
    print(("{%d, %d}-{%d, %d}"):format(
        site.global_min_x,
        site.global_min_y,
        site.global_max_x,
        site.global_max_y
    ))
end

local map = df.global.world.map
local unit = df.global.world.units.active[0]

local tx, ty = math.floor(map.region_x + unit.pos.x / 48), math.floor(map.region_y + unit.pos.y / 48)

for _, site in pairs(df.global.world.world_data.sites) do
    local tp = {site.pos.x, site.pos.y}

    if tp[1] * 16 + site.rgn_min_x <= tx and tx <= tp[1] * 16 + site.rgn_max_x and
        tp[2] * 16 + site.rgn_min_y <= ty and ty <= tp[2] * 16 + site.rgn_max_y then

        print(tp[1], tp[2])

        print_min_max(site)

        -- do return end

        -- Note: change the props here, but try to debug beforehand
        -- site.rgn_max_x = site.rgn_max_x + 1
        -- site.global_max_x = site.global_max_x + 1
        -- site.global_min_y = site.global_min_y - 1
        -- site.rgn_max_y = site.rgn_max_y + 1
        site.rgn_min_y = site.rgn_min_y - 1

        -- Fail-safe
        if site.rgn_max_x < site.rgn_min_x then
            site.rgn_max_x = site.rgn_min_x
        end

        if site.rgn_max_y < site.rgn_min_y then
            site.rgn_max_y = site.rgn_min_y
        end

        if site.global_max_x < site.global_min_x then
            site.global_max_x = site.global_min_x
        end

        if site.global_max_y < site.global_min_y then
            site.global_max_y = site.global_min_y
        end


        local translated = dfhack.TranslateName(site.name)
        print(("Site: %s"):format(#translated > 0 and translated or "(Unnamed site)"))

        print("New values:")
        print_min_max(site)

        print("Extended this site.")

        return
    end
end

print("Not in a site.")
