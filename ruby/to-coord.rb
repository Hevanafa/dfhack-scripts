# Modified from to-forge.rb
# Caution: before using this script, see
#   the coordinate using heva/where-cursor while
#   Look mode is active

Coords = {
    "surface" => [84, 91, 130],
    "forge" => [47, 81, 9],
    "cave1" => [52, 69, 41],
    "microcline" => [56, 110, 83]
}

if !$script_args[0] || $script_args[0].strip == "" then
    puts "Invalid argument [0]"
    puts "Allowed places: " + Coords.keys.join(" ")
    throw :script_finished
end

unit = df.world.units.active[0]

# set occupancy to false before going
df.map_tile_at(
    unit.pos.x, unit.pos.y, unit.pos.z
).occupancy.unit = false

x, y, z = *Coords[$script_args[0]]

unit.pos.x = x
unit.pos.y = y
unit.pos.z = z

puts "Moved successfully"