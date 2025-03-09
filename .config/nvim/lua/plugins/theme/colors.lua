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

colors.red                   = "#FF0000"
colors.black                 = "#000000"

-- aliases
colors.fg                    = colors.base8
colors.bg                    = colors.base15
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
