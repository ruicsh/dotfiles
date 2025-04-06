local obj = {}

obj.__index = obj

function obj:init()
	local syshyper = { "ctrl", "alt", "shift", "cmd" }

	local keysToApps = {
		{ syshyper, "l", "Firefox" },
		{ syshyper, ";", "Ghostty" },
	}

	for i in ipairs(keysToApps) do
		local hyper = keysToApps[i][1]
		local key = keysToApps[i][2]
		local app = keysToApps[i][3]

		hs.hotkey.bind(hyper, key, function()
			hs.application.launchOrFocus(app)
		end)
	end
end

return obj
