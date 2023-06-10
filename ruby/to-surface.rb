puts "(Deprecated) use to-coord instead"

# Modified from to-forge.rb
# Caution: before using this script, see
#   the coordinate using heva/where-cursor while
#   Look mode is active

unit = df.world.units.active[0]

df.map_tile_at(unit.pos.x, unit.pos.y, unit.pos.z).occupancy.unit = false

unit.pos.x = 84
unit.pos.y = 91
unit.pos.z = 130

puts "Moved successfully"