-- 11-06-2023
-- Based on add-reading-skill.lua

local utils = require "utils"
local unit = dfhack.gui.getSelectedUnit()

local unit_name = dfhack.df2console(
    dfhack.TranslateName(
        dfhack.units.getVisibleName(unit)
    )
)

assert(unit, "No selected unit!")

local skills = { "WRITING", "PROSE" }

for _, skill in pairs(skills) do
    local skill_id = df.job_skill[skill]
    local skill_name = df.job_skill.attrs[skill_id].caption_noun

    utils.insert_or_update(
        unit.status.current_soul.skills,
        { new = true, id = skill_id, rating = 1 }, "id"
    )

    print(("added %s skill to %s"):format(skill_name, unit_name))
end