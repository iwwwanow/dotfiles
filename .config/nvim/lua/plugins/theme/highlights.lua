local M = {}

require("plugins/theme/setters/core-settings").setCoreSettings()
require("plugins/theme/setters/terminal-colors").setTerminalColors()

local mergeTables = require("plugins/theme/utils/merge-tables").mergeTables

local setHighlights = require("plugins/theme/setters/highlights").setHighlights

local coreHighlights = require("plugins/theme/highlights/core")
local tsHighlights = require("plugins/theme/highlights/ts")
local debugHighlights = require("plugins/theme/highlights/ts")
local linkHighlights = require("plugins/theme/highlights/ts")

-- TODO to utils
local inspect = vim.inspect
-- vim.notify(inspect(coreHighlights), vim.log.levels.DEBUG)

function M.setup()
	local tables = mergeTables(coreHighlights, tsHighlights, debugHighlights, linkHighlights)
	setHighlights(tables)
end

return M
