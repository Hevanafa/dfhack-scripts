-- A basic GUI screen example
--[====[

heva-lua/gui-wave-demo
=================
By Hevanafa, 08-06-2023
Based on devel/hello-world: a basic GUI screen example

]====]

local gui = require("gui")
local widgets = require('gui.widgets')
-- local overlay = require('plugins.overlay')

-- local text = "enhanced advfort GUI"

-- Must be called with an empty table as the first parameter
-- screen_demo{}:show()
local screen_demo = defclass(screen_demo, gui.FramedScreen)

screen_demo.ATTRS{
    frame_style = gui.GREY_LINE_FRAME,
    frame_title = "Hi GUI",
    frame_width = 40,
    frame_height = 10,
    frame_inset = 1,

	angle = 0,
	menu_idx = 1
}

local labels = {}

function screen_demo:init()
	-- frame parameter uses left, right, top & bottom initials

	local label = widgets.Label{
		text = "Wave Demo",
		text_pen = COLOR_WHITE,
		frame = { l = 0, t = 0 }
	}

	local bottom_label = widgets.Label{
		text = "Esc - Close",
		text_pen = COLOR_GREY,
		frame = { l = 0, b = 0 }
	}

	self:addviews{label, bottom_label}

	-- for a = 1, 5 do
	-- 	local label = widgets.Label{
	-- 		text = ("Label %d"):format(a),
	-- 		text_pen = COLOR_DARKGREY,
	-- 		frame = { l = 0, t = a + 1 }
	-- 	}

	-- 	self:addviews{label}
	-- end

	-- local labels = {}
	for a = 1, 5 do
		local label = widgets.Label{
			text = ("Label %d"):format(a),
			text_pen = COLOR_DARKGREY,
			frame = { l = 0, t = a + 1 }
		}

		table.insert(labels, label)
	end

	labels[1].text_pen = COLOR_WHITE

	self:addviews(labels)
end

function screen_demo:deg2rad(deg)
	return deg / 180 * math.pi
end

-- painter can be named as "parent_rect" or "dc"
function screen_demo:onRenderBody(painter)
    -- painter:string("#", COLOR_LIGHTGREEN)
	local h = painter.height

	for a = 1, painter.width - 2 do
		local y = h / 2 + math.sin(self:deg2rad(a * 5 + self.angle)) * (h / 2 - 1)

		painter:seek(a, math.floor(y + 0.5)):string("X", { fg = COLOR_LIGHTCYAN })

		-- dfhack.screen.paintTile({
		-- 	ch = "X",
		-- 	fg = COLOR_LIGHTCYAN
		-- }, a, math.floor(y + 0.5))
	end

	self.angle = (self.angle + 2) % 360
end

function screen_demo:updateLabels()
	for a = 1, #labels do
		labels[a].text_pen = COLOR_DARKGREY
	end

	labels[self.menu_idx].text_pen = COLOR_WHITE

end

function screen_demo:onInput(keys)
    if keys.LEAVESCREEN or keys.SELECT then
        self:dismiss()

	elseif keys.STANDARDSCROLL_UP and self.menu_idx > 1 then
		self.menu_idx = self.menu_idx - 1
		self:updateLabels()

	elseif keys.STANDARDSCROLL_DOWN and self.menu_idx < 5 then
		self.menu_idx = self.menu_idx + 1
		self:updateLabels()
    end
end

screen_demo{}:show()
