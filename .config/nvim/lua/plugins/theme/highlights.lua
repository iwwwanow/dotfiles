local M = {}

require("plugins/theme/setters/core-settings").setCoreSettings()
require("plugins/theme/setters/terminal-colors").setTerminalColors()

local mergeTables = require("plugins/theme/utils/merge-tables").mergeTables

local setHighlights = require("plugins/theme/setters/highlights").setHighlights

local coreHighlights = require("plugins/theme/highlights/core")
local syntaxHighlights = require("plugins/theme/highlights/syntax")
local pluginHighlights = require("plugins/theme/highlights/plugin")

-- TODO to utils
local inspect = vim.inspect
-- vim.notify(inspect(coreHighlights), vim.log.levels.DEBUG)

function M.setup()
	local tables = mergeTables(coreHighlights, syntaxHighlights, pluginHighlights)
	setHighlights(tables)
end

return M
