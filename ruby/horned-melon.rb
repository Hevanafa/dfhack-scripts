# create a HORNED_MELON vine

cls = DFHack::ItemPlantst
mat_raw = "PLANT_MAT:HORNED_MELON:STRUCTURAL"
puts mat_raw

mat = df.decode_mat(mat_raw)

# create the item
item = cls.cpp_new
item.id = df.item_next_id
item.stack_size = 20
item.mat_type = mat.mat_type
item.mat_index = mat.mat_index

df.item_next_id += 1
item.categorize(true)
df.world.items.all << item

item.pos = df.cursor
item.flags.on_ground = true
df.map_tile_at.mapblock.items << item.id
df.map_tile_at.occupancy.item = true
