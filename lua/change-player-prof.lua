local unit = df.global.world.units.active[0]
if not unit then
	qerror("Not in adventurer mode!")
end

print(unit.profession)
unit.profession = 66  -- TRADER
print("New profession: " .. unit.profession)
