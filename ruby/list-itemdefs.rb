# List all item subtypes

# Example output:
# ITEM_AMMO_BOLTS: 0
# ITEM_AMMO_ARROWS: 1
# ITEM_AMMO_BLOWDARTS: 2
# ... and so on

# First found in rendermax.lua

df.world.raws.itemdefs.all.each{ |itemdef|
    puts "%s: %d" % [itemdef.id, itemdef.subtype]
}