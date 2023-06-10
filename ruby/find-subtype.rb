def findSubtype(id)
    found = df.world.raws.itemdefs.all.each{ |itemdef|
        if itemdef.id == id then
            return itemdef.subtype
        end
    }

    puts "Couldn't find " + id
    return -1
end

# puts findSubtype("ITEM_WEAPON_WHIP")
puts findSubtype "ITEM_WEAPON_HALBERD"