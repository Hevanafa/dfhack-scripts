# refer to map.rb > MapTile

tile = df.map_tile_at()
# puts tile.inspect()
puts "%s" % [tile.tilemat.to_s]

block = df.map_block_at(df.cursor)
# puts block.class.to_s

puts block.flags._whole.to_s(2).rjust(10, "0")