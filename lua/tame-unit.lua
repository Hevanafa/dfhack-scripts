-- Adapted from `create-unit.lua`

local unit = dfhack.gui.getSelectedUnit(true)

assert(unit, "No selected unit!")

-- If a friendly animal, make it domesticated.  From Boltgun & Dirst
local casteFlags = unit.enemy.caste_flags
if not(casteFlags.CAN_SPEAK and casteFlags.CAN_LEARN) then
    -- Fix friendly animals (from Boltgun)
    unit.flags2.resident = false
    unit.population_id = -1
    unit.animal.population.region_x = -1
    unit.animal.population.region_y = -1
    unit.animal.population.unk_28 = -1
    unit.animal.population.population_idx = -1
    unit.animal.population.depth = -1

    -- And make them tame (from Dirst)
    unit.flags1.tame = true
    unit.training_level = df.animal_training_level.Domesticated
end
