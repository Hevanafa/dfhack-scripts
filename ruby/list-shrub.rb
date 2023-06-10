# df.world.plants.all.each{ |plant|
#     # puts plant.class.to_s
#     # puts plant.flags.to_s
#     if plant.flags.is_shrub then
#         puts "Shrub at: " + [plant.pos.x, plant.pos.y, plant.pos.z] * " "
#     end
# }

# df.world.raws.plants.all.each{ |plant|
#     puts "%s: %s" % [plant.id.to_s, plant.name.to_s]
# }

df.each_shrub{ |shrub|
    puts shrub.class.to_s
    throw :script_finished
}