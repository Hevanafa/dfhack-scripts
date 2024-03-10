-- 10-03-2024
-- Idea: add XP to the player, try to make it the same as the usual dwarf gather shrub job

local plant_structural_const = 419
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
            -- print(dfhack.matinfo.decode(plant_structural_const, plant.material))

            local new_item = df.item.find(
                dfhack.items.createItem(
                    df.item_type.PLANT, -1,
                    plant_structural_const, plant.material, player_unit
                ))

            new_item.pos = xyz2pos(pos2xyz(plant.pos))
            new_item.stack_size = 1 + math.random(0, 2)
            new_item:calculateWeight()

            -- kill the shrub
            map_block.tiletype[pos.x % 16][pos.y % 16] = df.tiletype.ShrubDead

            break
        end
    end
end
