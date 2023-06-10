-- bring [whom] [to]
-- 10-06-2023

local args = {...}

if #args < 2 then
    qerror("2 unit IDs are required as parameters\nUse list-unit-ids to see unit IDs.")
end

local whom = df.unit.find(args[1]+0)
local target = df.unit.find(args[2]+0)

assert(whom, "Can't find unit to bring!")
assert(target, "Can't find the unit to bring to!")

dfhack.units.teleport(whom, target.pos)
