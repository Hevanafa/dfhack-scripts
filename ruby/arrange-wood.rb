# Arrange wood depending on the config
if df.cursor.x == -30000 then
    puts "You have to put your cursor somewhere"
    throw :script_finished
end

# Config
$StackSize = 40
$Columns = 23
$RowSize = $StackSize * $Columns

$count = 0
$tempCount = 0

x, y, z =
    df.cursor.x,
    df.cursor.y,
    df.cursor.z

df.world.items.all.each{ |item|
    className = item.class.to_s

    if className == "DFHack::ItemWoodst" then
        next unless df.item_isfree(item)
    
        deltaY = $count / $RowSize
        deltaX = $count % $RowSize / $StackSize
            
        $count += 1

        item.pos.x = x + deltaX
        item.pos.y = y + deltaY
        item.pos.z = z

        # to fix item disappearance
        item.flags.on_ground = true

        mapTile = df.map_tile_at()
        mapTile.mapblock.items << item.id
        mapTile.occupancy.item = true
    end

}

puts "Moved %d items" % $count
