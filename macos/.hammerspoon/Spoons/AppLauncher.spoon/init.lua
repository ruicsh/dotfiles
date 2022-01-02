local obj = {}
obj.__index = obj

function obj:init()
  local hyper = {"ctrl", "cmd"}

  local keysToApps = {
    { ',', 'Firefox' },
    { '.', 'Visual Studio Code' },
    { '/', 'iTerm'},
    { 'L', 'DevUtils'},
    { ';', 'Postman' },
    { "'", 'Docker' }
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
