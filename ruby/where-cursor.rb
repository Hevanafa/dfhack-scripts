cursor = df.cursor
puts df.cursor.to_s
puts "%d %d %d" % [cursor.x, cursor.y, cursor.z]
