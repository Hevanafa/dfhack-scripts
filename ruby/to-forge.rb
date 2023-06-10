puts "(Deprecated) use to-coord instead"

# Caution: before using this script, see
#   the coordinate using heva/where-cursor while
#   Look mode is active

unit = df.world.units.active[0]

df.map_tile_at(unit.pos.x, unit.pos.y, unit.pos.z).occupancy.unit = false

# puts unit.name.to_s

unit.pos.x = 47
unit.pos.y = 81
unit.pos.z = 9

puts "Moved successfully"