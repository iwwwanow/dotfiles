hs.hotkey.bind({"cmd"}, "return", function()
    hs.execute("open -n -a 'Ghostty'", true)
end)

-- setup modificators
local hyper = {"cmd", "alt", "ctrl"}
local mainMod = {"cmd"}
local mainMod_CTRL = {"cmd", "ctrl"}
local mainMod_ALT = {"cmd", "alt"}
local mainMod_SHIFT = {"cmd", "shift"}
local mainMod_SHIFT_CTRL = {"cmd", "shift", "ctrl"}

-- window naviation
hs.hotkey.bind(mainMod, "h", function()
    hs.window.focusedWindow():focusWindowWest()
end)

hs.hotkey.bind(mainMod, "j", function()
    hs.window.focusedWindow():focusWindowSouth()
end)

hs.hotkey.bind(mainMod, "k", function()
    hs.window.focusedWindow():focusWindowNorth()
end)

hs.hotkey.bind(mainMod, "l", function()
    hs.window.focusedWindow():focusWindowEast()
end)

-- INFO setup it into keyboard-shortcuts_mission-control
hs.hotkey.bind(mainMod_CTRL, "h", function()
    hs.eventtap.keyStroke({"ctrl"}, "left")
end)

hs.hotkey.bind(mainMod_CTRL, "l", function()
    hs.eventtap.keyStroke({"ctrl"}, "right")
end)

-- move window to workspace left|right
-- hs.hotkey.bind(mainMod_SHIFT_CTRL, "h", function()
--     local win = hs.window.focusedWindow()
--     hs.eventtap.keyStroke({"ctrl", "cmd"}, "left")
-- end)
--
-- hs.hotkey.bind(mainMod_SHIFT_CTRL, "l", function()
--     local win = hs.window.focusedWindow()
--     hs.eventtap.keyStroke({"ctrl", "cmd"}, "right")
-- end)
