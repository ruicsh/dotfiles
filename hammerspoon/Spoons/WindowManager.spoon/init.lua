local obj = {}
obj.__index = obj

function obj:init()
	hs.window.animationDuration = 0.0
	hs.grid.setMargins("0x0")
	hs.grid.setGrid("6x6")
	hs.grid.MARGINX = 0
	hs.grid.MARGINY = 0

	local hyper = { "ctrl", "alt" }
	local keysToCells = {
		{ "left", "0,0 3x6" }, -- left half
		{ "right", "3,0 3x6" }, -- right half
		{ "up", "0,0 6x3" }, -- top half
		{ "down", "0,3 6x3" }, -- bottom half

		{ "U", "0,0 3x3" }, -- top left
		{ "I", "3,0 3x3" }, -- top right
		{ "J", "0,3 3x3" }, -- bottom left
		{ "K", "3,3 3x3" }, -- bottom right

		{ "D", "0,0 2x6" }, -- first third
		{ "F", "2,0 2x6" }, -- center third
		{ "G", "4,0 2x6" }, -- last third
		{ "E", "0,0 4x6" }, -- first two thirds
		{ "T", "2,0 4x6" }, -- last two thirds

		{ "return", "0,0 6x6" }, -- maximize
	}

	for i in ipairs(keysToCells) do
		local key = keysToCells[i][1]
		local cell = keysToCells[i][2]

		hs.hotkey.bind(hyper, key, function()
			local win = hs.window.focusedWindow()
			hs.grid.set(win, cell)
		end)
	end
end

return obj
