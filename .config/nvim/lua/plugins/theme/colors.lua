local gradientGetterModule   = require('plugins/theme/getters/gradient-getter')
local mergeTablesUtilsModule = require('plugins/theme/utils/merge-tables')

local M                      = {}

local colors                 = {
	base0  = "#101010",
	base1  = "#191919",
	base2  = "#222222",
	base3  = "#2b2b2b",
	base4  = "#343434",
	base5  = "#3d3d3d",
	base6  = "#474747",
	base7  = "#515151",
	base8  = "#5b5b5b",
	base9  = "#656565",
	base10 = "#707070",
	base11 = "#7a7a7a",
	base12 = "#8f8f8f",
	base13 = "#a9a9a9",
	base14 = "#f0f0f0",
	base15 = "#ffffff",
}

-- aliases
colors.fg                    = colors.base2
colors.bg                    = colors.base15
colors.bg_alt                = colors.base14
colors.white                 = "#ffffff"
colors.black                 = "#000000"

colors.red                   = "#ff1f3d"
colors.error                 = colors.red
colors.neutral_red           = colors.red
colors.faded_red             = "#b5122c"

colors.yellow                = "#ffd800"
colors.warning               = colors.yellow
colors.neutral_yellow        = colors.yellow
colors.faded_yellow          = "#b89f00"

local accent_dark            = colors.base4
local accent_mid             = colors.base8
local accent_light           = colors.base12

colors.orange                = accent_mid
colors.neutral_orange        = accent_light
colors.faded_orange          = accent_mid

colors.green                 = accent_mid
colors.neutral_green         = accent_light
colors.faded_green           = accent_mid

colors.blue                  = accent_mid
colors.neutral_blue          = accent_light
colors.faded_blue            = accent_dark

colors.skyblue               = accent_light
colors.neutral_skyblue       = colors.base14
colors.faded_skyblue         = accent_mid

colors.purple                = accent_mid
colors.neutral_purple        = accent_light
colors.faded_purple          = accent_dark

colors.pink                  = "#fb0079"

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

colors.debug                 = colors.red

function M.getColors()
	-- TODO gray gradation; between fg and bg, with steps number
	local merged = mergeTablesUtilsModule.mergeTables(colors, grayGradation)
	return merged
end

return M
