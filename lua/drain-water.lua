-- Drain water at cursor

-- print(table.concat(df.flow_type, ", "))
-- print(df.flow_type)
-- qerror("")
local guidm = require 'gui.dwarfmode'

local cursor = guidm.getCursorPos()
local block = dfhack.maps.getTileBlock(cursor)

if block then
    local x, y = pos2xyz(cursor)
    -- local tile = block.tiletype[x % 16][y % 16]

    local designation = block.designation[x % 16][y % 16]

    if designation.flow_size > 0 then
        print(designation.liquid_type)
        -- print(df.tile_liquid)
        print(designation.flow_size)
        block.designation[x % 16][y % 16].flow_size = 1
    --     if designation.liquid_type == df.tile_liquid.Water then
    --         designation.flow_size = 1
    --     end
    end
end


-- for k, block in pairs(df.global.world.map.map_blocks) do
--     -- df.tile_liquid.Water
--     if block.designation.liquid_type == df.flow_type.Water then
--         print("Dit is water")
--         break
--     end
-- end