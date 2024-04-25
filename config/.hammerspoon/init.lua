-- Kitty configuration
hs.hotkey.bind({"cmd"}, "`", function()
  -- Get current space
  local currentSpace = hs.spaces.focusedSpace()

  -- Get kitty app
  local app = hs.application.get("kitty")

  -- If app already open:
  if app then
      -- If no main window, then open a new window
      if not app:mainWindow() then
          app:selectMenuItem("New OS Window", true)

      -- If app is already in front, then hide it
      elseif app:isFrontmost() then
          app:hide()

      -- If there is a main window somewhere, bring it to current space and to front
      else
          -- First move the main window to the current space
          hs.spaces.moveWindowToSpace(app:mainWindow(), currentSpace)
          -- Activate the app
          app:activate()
          -- Raise the main window and position correctly
          -- app:mainWindow():raise()
          app:mainWindow():moveToUnit('0.0,0.0,1.0,0.75')
      end

  -- If app not open, open it
  else
      hs.application.launchOrFocus("kitty")
      app = hs.application.get("kitty")
  end
end)

-- Hide kitty if not in focus
hs.window.filter.default:subscribe(hs.window.filter.windowFocused, function(window, appName)
  local app = hs.application.get('kitty')
  if app ~= nil then
     app:hide()
  end
end)
