local guidm = require("gui.dwarfmode")
local cursor = guidm.getCursorPos()

if not cursor then
    qerror("Place your cursor somewhere")
end

local setCurPos = guidm.setCursorPos

-- cursor.x = 96
-- cursor.y = 81
-- cursor.z = 9

-- cursor.x = 84
-- cursor.y = 91
cursor.z = 130

setCurPos(cursor)
