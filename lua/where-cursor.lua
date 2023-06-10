-- local guidm = require("gui.dwarfmode")
-- local cursor = guidm.getCursorPos()
local cursor = df.global.cursor
local x, y, z = pos2xyz(cursor)

if not x then
    qerror("Place your cursor somewhere")
end

print(("%d %d %d"):format(x, y, z))
