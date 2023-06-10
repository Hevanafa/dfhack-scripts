# df.each_map_block{ |block|
#     puts block.class.to_s
#     throw :script_finished
# }

(-5..5).each{ |y|
    row = ""

    (-5..5).each{ |x|
        tile = df.map_tile_at(df.cursor.x + x, df.cursor.y + y, df.cursor.z)
        row += tile.tiletype.to_s == "OpenSpace" ?
            " " : tile.tiletype.to_s["Floor"] ?
            "." : "#"
    }

    puts row
}
