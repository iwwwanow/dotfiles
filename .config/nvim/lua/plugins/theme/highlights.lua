local M = {}

require("plugins/theme/setters/core-settings").setCoreSettings()
require("plugins/theme/setters/terminal-colors").setTerminalColors()

local setHighlights = require("plugins/theme/setters/highlights").setHighlights

local coreHighlights = require("plugins/theme/highlights/core")
local tsHighlights = require("plugins/theme/highlights/ts")
local debugHighlights = require("plugins/theme/highlights/ts")
local linkHighlights = require("plugins/theme/highlights/ts")

-- TODO to utils
-- local inspect = vim.inspect
-- vim.notify(inspect(colors), vim.log.levels.DEBUG)

function M.setup()
	setHighlights(coreHighlights)
	setHighlights(tsHighlights)
	setHighlights(debugHighlights)
	setHighlights(linkHighlights)
end

return M
