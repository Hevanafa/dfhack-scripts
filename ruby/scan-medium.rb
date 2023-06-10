# improved version of scan-small.rb
# using heva/tile-type to detect 1 tile

(-5..5).each{ |y|
    # row = ""

    (-5..5).each{ |x|
        tile = df.map_tile_at(
            df.cursor.x + x, df.cursor.y + y, df.cursor.z
        )

        tile.designation.hidden = false

        # row += tile.tiletype.to_s == "OpenSpace" ?
        #     " " : tile.tiletype.to_s == "FeatureWall" ?
        #     "$" : tile.tiletype.to_s["Floor"] ?
        #     "." : "#"
    }

    # puts row
}
