local gradientGetterModule   = require('plugins/theme/getters/gradient-getter')
local mergeTablesUtilsModule = require('plugins/theme/utils/merge-tables')

local M                      = {}

local colors                 = {
	base0  = "#202020",
	base1  = "#c30670",
	base2  = "#10a778",
	base3  = "#a79c14",
	base4  = "#008ec4",
	base5  = "#523b78",
	base6  = "#20a4b9",
	base7  = "#d9d9d9",
	base8  = "#414141",
	base9  = "#fb0079",
	base10 = "#5ed6ae",
	base11 = "#f3e42f",
	base12 = "#20bafb",
	base13 = "#6854de",
	base14 = "#4fb8cc",
	base15 = "#f0f0f0",
}


-- aliases
colors.fg                    = colors.base8
colors.bg                    = colors.base15
-- TODO 4 pts darker
colors.bg_alt                = "#E6E6E6"
colors.white                = "#FFFFFF"

-- TODO: зафиксировать, сделать для терминала аналогично
colors.red = "#FF0000"
colors.neutral_red = "#FF9999"
colors.faded_red = "#CC0000"

colors.orange = "#FF8000"
colors.neutral_orange = "#FFCC99"
colors.faded_orange = "#CC6600"

colors.yellow = "FFFF00"
colors.neutral_yellow = "#FFFF99"
colors.faded_yellow = "#CCCC00"

colors.green = "#00FF00"
colors.neutral_green = "#99FF99"
colors.faded_green = "#00CC00"

colors.blue = "#0000FF"
colors.neutral_blue = "#9999FF"
colors.faded_blue = "#0000CC"

colors.skyblue = "#00FFFF"
colors.neutral_skyblue = "#E6FFFF"
colors.faded_skyblue = "#00CCCC"

colors.purple = "#FF00FF"
colors.neutral_purple = "#FF99FF"
colors.faded_purple = "#CC00CC"

colors.black                 = "#000000"

-- colors.bg_alt                = colors.base1
-- colors.neutral_green         = colors.base2
-- colors.neutral_blue          = colors.base4
-- colors.neutral_red           = colors.base1
-- colors.neutral_yellow        = colors.base3
-- colors.neutral_orange        = colors.base1
-- colors.faded_red             = colors.base1
-- colors.faded_yellow          = colors.base3
-- colors.faded_blue            = colors.base4
-- colors.bright_blue           = colors.base3

-- -- gray-gradation
-- colors.gray1          = colors.base8
-- colors.gray2          = colors.base9
-- colors.gray3          = colors.base10
-- colors.gray4          = colors.base11
-- colors.gray5          = colors.base12
-- colors.gray6          = colors.base13
-- colors.gray7          = colors.base14
-- colors.gray8          = colors.base15
-- colors.gray9          = colors.base7

local grayGradation          = gradientGetterModule.createHexColorGradient(colors.fg, colors.bg, 8)

colors.debug                 = "#FF0000"

function M.getColors()
	-- TODO gray gradation; between fg and bg, with steps number
	local merged = mergeTablesUtilsModule.mergeTables(colors, grayGradation)
	return merged
end

return M
