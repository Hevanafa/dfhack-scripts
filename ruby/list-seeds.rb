# ItemSeedsst < ItemActual < Item < MemHack::Compound

df.world.items.all.each{ |item|
    if item.getType().to_s == "SEEDS" then
        puts item.getMaterial()
        puts item.getMaterialIndex()
        puts item.getPlantID()
    end
    # puts item.class.to_s
}