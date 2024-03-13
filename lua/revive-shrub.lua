-- 10-03-2024

local pos = copyall(df.global.cursor)

assert(pos, "(l)ook mode is required!")

for _, plant in pairs(df.global.world.plants.all) do
    if plant.pos.x == pos.x and
        plant.pos.y == pos.y and
        plant.pos.z == pos.z then
    
        local map_block = dfhack.maps.getTileBlock(pos)
        local tiletype = map_block.tiletype[pos.x % 16][pos.y % 16]
        -- print(tiletype)

        if tiletype == df.tiletype.ShrubDead then
            map_block.tiletype[pos.x % 16][pos.y % 16] = df.tiletype.Shrub
            print("Revived this plant.")
            break
        end
    end
end
