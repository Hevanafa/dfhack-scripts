# DFHack Findings

10-06-2023

hotkeys - list all keybindings on DF game screen

keybinding add/set - add a new hotkey/keybinding

keybinding clear

A few lines that I added to `dfhack.init` for advfort:
```
keybinding add Alt-T@dungeonmode "gui/advfort FellTree"
keybinding add Alt-D@dungeonmode "gui/advfort Dig"
keybinding add Alt-B@dungeonmode "gui/advfort Build"
```

- <key>Alt+T</key> for felling tree
- <key>Alt+D</key> for digging
- <key>Alt+B</key> for building

This makes it kind of similar to Minecraft.


How to obtain the active/selected unit ID:
```
teleport -showunitid
```

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

Whenever I got stuck, I usually either:
- search for any related keywords in the whole `hack` folder
- go to the [DFHack GitHub](https://github.com/DFHack/dfhack) & see if I can find the original struct/enum

