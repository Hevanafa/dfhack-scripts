-- 11-06-2023

local utils = require "utils"
local unit = dfhack.gui.getSelectedUnit()

local unit_name = dfhack.df2console(
    dfhack.TranslateName(
        dfhack.units.getVisibleName(unit)
    )
)

assert(unit, "No selected unit!")

local skill_id = df.job_skill["READING"]
local skill_name = df.job_skill.attrs[skill_id].caption_noun

print(skill_name)

utils.insert_or_update(
    unit.status.current_soul.skills,
    { new = true, id = skill_id, rating = 1 }, "id"
)

print("added reading skill to "..unit_name)