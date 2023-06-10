-- transform seeds to plants
-- based on count-seeds-cursor
-- 10-06-2023

local count = 0

local cursor = copyall(df.global.cursor)

local nearest_unit
local nearest = 10000
-- df.global.world.units.all

for _, unit in pairs(df.global.world.units.all) do
    local pos = copyall(unit.pos)
    local dist = math.sqrt((cursor.x - pos.x) ^ 2 + (cursor.y - pos.y) ^ 2 + (cursor.z - pos.z) ^ 2)

    if nearest > dist then
        nearest = dist
        nearest_unit = unit
        break
    end
end

if nearest_unit == nil then
    qerror("Can't find the nearest unit!")
end

for _, item in pairs(df.global.world.items.all) do
    if item:getType() == df.item_type.SEEDS and
        same_xyz(cursor, item.pos) then

        -- found in create-item.lua:
        -- createItem({mattype,matindex},{itemtype,itemsubtype},quality,unit,description,1)
        -- function createItem(mat,itemType,quality,creator,description,amount)
        -- dfhack.items.createItem(itemType[1], itemType[2], mat[1], mat[2], creator)

        -- for creator/unit param: df.unit.find(tonumber(args.unit))
        
        -- found getType() under class Item in ruby-autogen-win.rb
        -- found dfhack.items.getDescription(item, 0) in do-job-now.lua
        -- found dfhack.df2console( dfhack.items.getDescription(item, 0, true) ) in uniform-unstick.lua
        -- found local x, y, z = dfhack.items.getPosition(item) in uniform-unstick.lua

        print(dfhack.items.getDescription(item, 0))

        -- local item_type = item:getType()
        local item_type = df.item_type.PLANT
        local subtype = item:getSubtype()
        -- Todo: mat_type is mismatch
        -- Example: when converting flax seeds, it turns out the plant is still of flax seeds, not STRUCTURAL
        -- found the STRUCTURAL ID: 419, obtained from gui/create-item
        local mat_type = 419 -- item.mat_type
        local mat_index = item.mat_index

        -- this produces the duplicate of the item
        -- Todo: find how to create the STRUCTURAL of the plant
        -- Found in pref-adjust.lua: dfhack.matinfo.find("MUSHROOM_HELMET_PLUMP:STRUCTURAL").index
        -- Found in exportlegends.lua: dfhack.matinfo.decode(event.mattype, event.matindex)
        print(item_type.." "..subtype.." "..mat_type.." "..mat_index)

        local newItem = df.item.find(
            dfhack.items.createItem(
                item_type, subtype,
                mat_type, mat_index,
                nearest_unit))
        
        local stack_size = 1 + math.random(0, 2)
        newItem:setStackSize(stack_size)

        print(newItem.mat_type)
        print(newItem.mat_index)

        count = stack_size
    end
end

print(("Transformed seeds at cursor, yielding %d plants"):format(count))
