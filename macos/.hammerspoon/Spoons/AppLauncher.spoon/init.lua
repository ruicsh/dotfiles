local obj = {}
obj.__index = obj


function obj:init()
  local hyper = {"ctrl", "alt", "shift", "cmd"}
  local keysToApps = {
    { 'p', 'Firefox' },
    { '[', 'Visual Studio Code' },
    { "]", 'iTerm'},
  }

  for i in ipairs(keysToApps) do
    local key = keysToApps[i][1]
    local app = keysToApps[i][2]

    hs.hotkey.bind(hyper, key, function () 
      hs.application.launchOrFocus(app)
    end)
  end
end

return obj
