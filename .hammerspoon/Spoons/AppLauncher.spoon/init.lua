local obj = {}

obj.__index = obj

function obj:init()
	local syshyper = { "cmd" }

	local keysToApps = {
		{ syshyper, "1", "Firefox" },
		{ syshyper, "2", "Ghostty" },
		{ syshyper, "3", "Microsoft Teams" },
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
