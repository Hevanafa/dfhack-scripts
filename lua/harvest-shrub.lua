-- 10-03-2024
-- Idea: add XP to the player, try to make it the same as the usual dwarf gather shrub job
-- Note: after using this script, if you want to build on top of the dead shrub, even though you've picked up the plant item, you should either (T)ravel or (w)ait to reload the local site information.  This will prevent freezing when building on top of the affected tiles.

local mat_type_plant_structural = 419
local player_unit = df.global.world.units.active[0]
local pos = copyall(df.global.cursor)

assert(pos, "(l)ook mode is required!")

for _, plant in pairs(df.global.world.plants.all) do
    if plant.pos.x == pos.x and
        plant.pos.y == pos.y and
        plant.pos.z == pos.z then
    
        local map_block = dfhack.maps.getTileBlock(pos)
        local tiletype = map_block.tiletype[pos.x % 16][pos.y % 16]
        -- print(tiletype)

        if tiletype == df.tiletype.Shrub then
            -- print(plant.material)
            -- print(dfhack.matinfo.decode(mat_type_plant_structural, plant.material))

            local new_item = df.item.find(
                dfhack.items.createItem(
                    df.item_type.PLANT, -1,
                    mat_type_plant_structural, plant.material, player_unit
                ))

            new_item.pos = xyz2pos(pos2xyz(plant.pos))
            new_item.stack_size = 1 + math.random(0, 2)
            new_item:calculateWeight()

            -- kill the shrub
            map_block.tiletype[pos.x % 16][pos.y % 16] = df.tiletype.ShrubDead

            break
        else
            qerror("This isn't a shrub!")
        end
    end
end
