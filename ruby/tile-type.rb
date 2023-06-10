if df.cursor.x == -30000 then
    puts "You have to put your cursor somewhere"
    throw :script_finished
end

puts "Tile at %d %d %d" % [df.cursor.x, df.cursor.y, df.cursor.z]

tile = df.map_tile_at(df.cursor)
puts "class   : " + tile.class.to_s
puts "tiletype: " + tile.tiletype.to_s
puts "tilemat : " + tile.tilemat.to_s
puts "variant : " + tile.variant.to_s
puts "special : " + tile.special.to_s
puts "mat_info : " + tile.mat_info.to_s

block = df.map_block_at(df.cursor.x, df.cursor.y, df.cursor.z)
puts "flows:"
block.flows.each{ |flow|
    puts "density: " + flow.density.to_s
}