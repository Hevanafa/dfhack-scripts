-- 05-03-2024

local cursor = copyall(df.global.cursor)

-- ItemToolst.subtype.description
-- ItemToolst.subtype has the type of ItemdefToolst
-- ItemdefToolst

local adjective = "written"
-- local desc = ""
-- Just for testing
-- local desc = "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456"

-- The description can only contain up to 255 characters, more than that will crash the game.
-- New lines are turned into box with a circle character, so it's better to use spaces instead.
local desc = [[
How to Prepare Papyrus Sheets

1. Take some papyrus sedges,
2. Build a farmer's workshop,
3. Place the papyrus sedges at the workshop,
4. Open workshop menu,
5. Choose "Make sheet from plant"
]]

for _, item in pairs(df.global.world.items.all) do
    if same_xyz(cursor, item.pos) and
        item:getType() == df.item_type.TOOL and
		item.flags.on_ground and
		item.subtype.tool_use[0] == df.tool_uses.CONTAIN_WRITING then
		

		-- print(item.subtype.value)
		-- break
		
		item.subtype.adjective = adjective or ""

		if #desc > 255 then
			print("Warning: The text has been trimmed to fit the 255 character limit.")
		end

		item.subtype.description = desc:gsub("\n", " "):sub(1, 255)

		print("New adjective:" .. item.subtype.adjective)
		print("New description:" .. item.subtype.description)
		break
	end
end
