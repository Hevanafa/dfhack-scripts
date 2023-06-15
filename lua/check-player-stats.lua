-- Drinking / eating once reduces the timer by 50000 units

local unit = df.global.world.units.active[0]
if not unit then
	qerror("Not in adventurer mode!")
end

print(("Hunger: %d"):format(unit.counters2.hunger_timer))
print(("Thirst: %d"):format(unit.counters2.thirst_timer))
print(("Sleepiness: %d"):format(unit.counters2.sleepiness_timer))
