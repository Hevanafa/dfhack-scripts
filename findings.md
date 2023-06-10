# DFHack Findings

10-06-2023

Get active cursor ([l]ook mode):
```lua
local cursor = copyall(df.global.cursor)
```

Check if 2 objects have the same position:
```lua
same_xyz(cursor, item.pos)
```

How to list loaded world items:
```lua
df.global.world.items.all --table
```

How to list loaded units:
```lua
for _, unit in pairs(df.global.world.units.all) do
    local race_name = dfhack.units.getRaceName(unit)
    print(race_name)
end

```