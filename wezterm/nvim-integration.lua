local wezterm = require('wezterm')
local action = wezterm.action

local function isViProcess(pane)
   local foreground_process_name = pane:get_foreground_process_name()
   return foreground_process_name and foreground_process_name:find('n?vim') ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
   if isViProcess(pane) then
      window:perform_action(action.SendKey({ key = vim_direction, mods = 'CTRL' }), pane)
   else
      window:perform_action(action.ActivatePaneDirection(pane_direction), pane)
   end
end

wezterm.on('ActivatePaneDirection-right', function(window, pane)
   conditionalActivatePane(window, pane, 'Right', 'l')
end)
wezterm.on('ActivatePaneDirection-left', function(window, pane)
   conditionalActivatePane(window, pane, 'Left', 'h')
end)
wezterm.on('ActivatePaneDirection-up', function(window, pane)
   conditionalActivatePane(window, pane, 'Up', 'k')
end)
wezterm.on('ActivatePaneDirection-down', function(window, pane)
   conditionalActivatePane(window, pane, 'Down', 'j')
end)

local keys = {
   left = { key = 'h', mods = 'CTRL', action = action.EmitEvent('ActivatePaneDirection-left') },
   down = { key = 'j', mods = 'CTRL', action = action.EmitEvent('ActivatePaneDirection-down') },
   up = { key = 'k', mods = 'CTRL', action = action.EmitEvent('ActivatePaneDirection-up') },
   right = { key = 'l', mods = 'CTRL', action = action.EmitEvent('ActivatePaneDirection-right') },
}

return keys
