# DFHack Findings

10-06-2023

hotkeys - list all keybindings on DF game screen

keybinding add/set - add a new hotkey/keybinding

keybinding clear

gui/create-item - create 1 item (anything)

A few lines that I added to `dfhack.init` for advfort:
```
keybinding add Alt-T@dungeonmode "gui/advfort FellTree"
keybinding add Alt-D@dungeonmode "gui/advfort Dig"
keybinding add Alt-B@dungeonmode "gui/advfort Build"
keybinding add Alt-H@dungeonmode "gui/advfort DigChannel"
```

- <key>Alt+T</key> for felling tree
- <key>Alt+D</key> for digging
- <key>Alt+B</key> for building
- <key>Alt+H</key> for digging a channel

This makes it kind of similar to Minecraft.

Edit 18-06-2023: Added dig channel


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

How to get x, y, z:

Use pos2xyz

```lua
local x, y, z = pos2xyz(df.global.cursor)
local pos = xyz2pos(x, y, z)
```

How to get the player unit:

```lua
local unit = df.global.world.units.active[0]
```

How to stop script when receiving an error:

```lua
qerror(message)
assert(variable, message)
```

How to check if a unit is alive:

```lua
dfhack.units.isAlive(unit)
```

Whenever I got stuck, I usually either:
- search for any related keywords in the whole `hack` folder
- go to the [DFHack GitHub](https://github.com/DFHack/dfhack) & see if I can find the original struct/enum


## How to keep builds in the wilderness

Chop tree but use the original DF fell tree -- use <kbd>g</kbd> in adventure mode.  This will turn the chunk into something like "Unnamed Unimportant Site".  This is useful if you don't want to make a 3x3 camp.


11-06-2023

## About Glass Furnace

**Collect Sand** works just like the usual (g)et sand, but you should have your adventurer's both hands full so that the sand can go directly into your backpack.

Then, (p)ut each unit of sand into bags.

**Make raw green glass** in glass furnace will turn **all** sand in the bag into just 1 unit of raw glass.

It's better to find a volcano or use `liquids` command first before making any kind of magma-related workshops.


## About Farm Plots

Farm plots can only yield 1 type of harvest.  So it's better to make smaller plots instead of making a big one at once.

There is "fortress seed count limit".  So your planted seeds will disappear once it reach the threshold.

There's a frequent case where farm plots are just 'reset'.

I think it's better to make your own barrels or bags, sell them to the merchants in the town, cheat spawn plants, combine the plants with my script, then put them in the barrels/bags.  Usually the maximum stack is around 60 for plant items.


## How to get unit's name

Found this in `make-legendary.lua`

```lua
function getName(unit)
    return dfhack.df2console(dfhack.TranslateName(dfhack.units.getVisibleName(unit)))
end
```


15-06-2023

## How to Start Clear Glass Industry

1. Get some wood, bags of sand & some fire-safe materials,
2. Make these workshops:
	- wood furnace
	- ashery
	- kiln
	- either magma or normal glass furnace
3. Burn wood logs into ash 'bars' in the wood furnace,
4. Make potash from ash in the ashery,
4. Make pearlash (from potash) 'bars' in the kiln,
5. Bring the bag of sand & pearlash 'bars' to the glass furnace.


## How to Collect Clay

Dwarf fortress mode: Designate a collection area for clay

Adventure mode: You can't.  You'll need to cheat for inorganic clay boulders or mine for kaolinite.


## Building Orientation / Direction

0: west to east  ->
1: east to west  <-
2: north to south
3: south to north

Added 01-07-2023: Screw Pump Directions
0: from north
1: from east
2: from south
3: from west


16-06-2023

## How to make steel

Flux stones:
- calcite
- chalk
- dolomite
- limestone
- marble

Sources of fuel & carbon:
- bituminous coal (smelter, 9 coke)
- lignite (smelter, 5 coke)
- wood (wood furnace, 1 charcoal)

### Steps

Prepare:

- 2 bars of iron
- 2 flux boulders
- 4 units of fuel (only 2 if there's magma)

Stand at the Smelter,

Then, follow these steps:

1. Make pig iron bars:
	- iron
	- carbon
	- flux stone
	- fuel
2. Make the steel bars:
	- pig iron
	- iron
	- carbon (either charcoal or coke)
	- flux stone
	- fuel

Result: 2 bars of steel


### How to find flux stones

Use `reveal`, then `prospect`.

Usually, the names are under "Layer materials".

Refs:
https://dwarffortresswiki.org/index.php/Flux
https://dwarffortresswiki.org/index.php/DF2014:Steel


## About Stud with Gold

In advfort, NEVER decorate/adorn anything.

The item will disappear instead of getting decorated as expected.

To see yourself, make a training sword/spear/axe, then decorate it at the craftdwarf's workshop.


17-06-2023

## About advfort not working when there's no Dwarf civ

Simply change set_civ to true in settings, in `advfort.lua`.


## Cheating Health

Use `full-heal`.

For my liking, I disabled resetting hunger_timer, thirst_timer & sleepiness_timer to make it still necessary to eat, drink & rest.


## How to get the selected unit

Use:
```lua
local unit = dfhack.gui.getSelectedUnit(true)
```


## How to domesticate/tame a unit

See `domesticateUnit` in `create-unit.lua`.


## Where is Camp?

:Camp is in the class `WorldSiteType`

See class WorldSite too.  Lua equivalent: <world_site>

I want to create my own site with DFHack.

World sites vector: `df.global.world.world_data.sites`

WorldData :sites (stl_vector)

Added `mark-camp.lua`.

To make this a 1x1 site, fell tree first, then call `mark-camp.lua`.

To change the site's name, press `b` then `N`.  Currently, there's no way to remove the name.

Caution: any dug tiles or felled trees will be permanent, so it's not recommended if you want to get unlimited resources.


## How to get a readable name

Use `dfhack.TranslateName(site.name)`.

See `LanguageNameComponent` for the details.


## How to obtain the complete recipe (for workshops)

Use `add-recipe`.


## How to 'fast travel'

Use `questport` while looking at the (Q)uest map.


## About Town Slab Engravings

There's the class `SlabEngravingType`.  I wonder if I can manipulate it.

Found `getSlabEngravingType()` in the class `Item`, which returns `SlabEngravingType` enum.

Added `list-slabs-cursor.lua` and `change-slabs-cursor.lua`.

See the class `SlabEngravingType` for the engraving types.


## Random Findings

Found `SiteRealizationBuildingType`.
Found enum class `JobType`
Lua equivalent: df.job_type


## How to Change Profession

Found class `Profession`
Can be used in unit.profession

Added `change-player-prof.lua`


## How to add announcement (also append to gamelog.txt)

Use `dfhack.gui.showAnnouncement(msg, fg, bg)`


## TWBT (fancy DF ASCII shader thing)

https://github.com/thurin/df-twbt/releases/tag/0.47.05-r8

Copy the DLL file to DFHack's plugins folder.

Copy the transparent1px.png, white1px.png, shadows.png to your `data\art` folder.

Add these lines to dfhack.init:
```
# TWBT
multilevel 15
```

## How to add action (WIP)

addJobAction(job, unit)

Find make_native_job(args) in advfort
df.job:new()

PlantGatherFix
cur_mode[3]
post_actions = cur_mode[4]
```lua
job_ptr = adv.job.current_job
job_action = findAction(adv, df.unit_action_type.Job)
ContinueJob(adv)
-- c_job = unit.job.current_job
addJobAction(c_job,unit)

-- addJobAction()
local data = {type=df.unit_action_type.Job,data={job={x=pos.x,y=pos.y,z=pos.z,timer=10}}}
add_action(unit, data)

--
--[[    low level job management    ]]--
function findAction(unit,ltype)
    ltype=ltype or df.unit_action_type.None
    for i,v in ipairs(unit.actions) do
        if v.type==ltype then
            return v
        end
    end
end

-- add_action()
action = findAction(unit) -- find empty action
local tbl=copyall(action_data)
tbl.new=true
tbl.id=unit.next_action_id
unit.actions:insert("#", tbl)
unit.next_action_id=unit.next_action_id+1
```


18-06-2023

## About scattered quires in the camp

After trying with the stolen codices & scrolls, the items placed inside a display case don't move anymore.


Idea: try to assign an owner civ so that I can retire at my own camp


## About pearlash

When `set_civ` is set to `true` in `advfort.lua`, "make pearlash" option isn't available.  So it should be set to "MOUNTAIN"


20-06-2023

## How-to: Clean Blood pools & spatters at the map

Use: `clean map`

Idea: bring underworld demons to the surface


22-06-2023

Found `item:moveToGround(x, y, z)`
Found item:getStorageInfo
Found item:setTemperature(temp, local, contained)
Found item:getItemBasicName(arg0)
Found item:getCurrencyValue(appraiser)

Found dfhack.items.getContainedItems(item) in advfort > AddItem()
Found dfhack.items.moveToBuilding(v.item,building,0)

in build-now.lua:
Found dfhack.items.getHolderBuilding(item)
Found ref:getType() == df.general_ref_type.BUILDING_HOLDER

To print an error message:
`dfhack.printerr`


## How to Declutter Workshops

Use `pull-building-seeds`, then `combine-seeds-cursor`.


Idea: drop items from a unit with `getHolderUnit` and `moveToGround` at the unit's position, then use `combine-plant-growths`, particularly useful when gathering fruits

Found dfhack.items.getHolderUnit in `Lua API.txt`


23-06-2023

## Maximum barrel capacity

30 units of fish/raw fish

24-06-2023

## How to Retire at Your Own Camp

1. Mark your important location first as a camp
2. Build (key: b)
3. Assign zones/rooms (key: z)
4. Add location (key: a)
5. Make it the main hall
6. Close the build menu
7. Shout to everyone (key: k)
8. Claim this location for yourself
9. Set the group name
10. Be in the main hall


## About Cage Traps

I think it's possible to cage a live animal by first setting up a cage trap and then use `bodyswap` at that creature, and then finally walking into the trap.

Edit: it's not possible to set up cage traps for some reason -- it doesn't get triggered or even finish being built


## How to extend an existing camp

Added `extend-camp.lua` script


## Where actually is the date GUI?

`hack/lua/plugins/dwarfmonitor.lua`
~~I changed the default y from 1 to 2 like this:~~
```lua
DateWidget.ATTRS{
    default_pos={x=-16,y=2},
	-- ...
}
```

Open `dfhack-config\dwarfmonitor.json` instead, and change the position Y to 1


## How to resurrect a recently deceased unit

Use `heva/lua/list-unit-ids`
Find the unit that you want to resurrect
Use `full-heal -r -unit [ID]`
The corpse will stay there and your unit will return
It's recommended to dispose of your corpse in a campfire or lava


## How much exactly is the capacity of a pouch?

100 units of something

1600 coins in total


25-06-2023

Found "WorldSiteRealization"
- mini_rivers
- mini_tiles
- mini_colors
- road_map
- river_map
- building_map
- flags_map
- zoom_tiles
- zoom_colors
- areas
- building_well


## About Demon Corpses

After killing a demon, it is **strongly** recommended not to touch the corpse.  Walking over it is okay, but not (g)etting it.

For some reason, the demons at the surface (if any) can teleport & find the player pretty quickly.  Added with how fast they run, it's terrifying.

Demons can be killed by crushing them under a constructed floor trap linked with a support & a lever.


29-06-2023
Idea: Make a (prepared) fish to meat converter