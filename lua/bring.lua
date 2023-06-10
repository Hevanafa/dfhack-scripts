-- bring [whom] [to]

local args = {...}
local whom = df.unit.find(args[1]+0)
local target = df.unit.find(args[2]+0)

assert(whom, "Can't find unit to bring!")
assert(target, "Can't find the unit to bring to!")

dfhack.units.teleport(whom, target.pos)
