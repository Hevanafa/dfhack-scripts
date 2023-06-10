local guidm = require("gui.dwarfmode")
local cursor = guidm.getCursorPos()

if not cursor then
    qerror("Place your cursor somewhere")
end

print(("%d %d %d"):format(cursor.x, cursor.y, cursor.z))
