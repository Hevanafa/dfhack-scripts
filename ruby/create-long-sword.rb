# Warning: this will crash the game

$baseStruct = DFHack::ItemWeaponst

rawMaterial = "INORGANIC:DIVINE_1"
puts rawMaterial
$material = df.decode_mat(rawMaterial)

# tempItem = $baseStruct.cpp_new
# puts tempItem.subtype.class.to_s

# throw :script_finished

def findSubtype(id)
    found = df.world.raws.itemdefs.all.each{ |itemdef|
        if itemdef.id == id then
            return itemdef.subtype
        end
    }

    puts "Couldn't find " + id
    return -1
end

def createWeapon(x, y, z)
    item = $baseStruct.cpp_new
    item.id = df.item_next_id
    item.stack_size = 10
    item.mat_type = $material.mat_type
    item.mat_index = $material.mat_index
    # item.subtype = findSubtype("ITEM_WEAPON_HALBERD")

    df.item_next_id += 1
    item.categorize(true)
    df.world.items.all << item

    item.pos = df.cursor
    item.pos.x += x
    item.pos.y += y
    item.pos.z += z

    item.flags.on_ground = true

    df.map_tile_at.mapblock.items << item.id
    df.map_tile_at.occupancy.item = true
end

createWeapon(0, 0, 0)
