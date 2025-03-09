-- Функция для линейной интерполяции между двумя значениями
local function lerp(a, b, t)
	return a + (b - a) * t
end

-- Функция для преобразования hex-цвета (#RRGGBB) в таблицу с r, g, b значениями (числа от 0 до 255)
local function hexToRGB(hex)
	-- Убираем символ '#' если он присутствует
	hex = hex:gsub("#", "")
	if #hex ~= 6 then
		error("Неверный формат hex-цвета: " .. hex)
	end
	local r = tonumber(hex:sub(1, 2), 16)
	local g = tonumber(hex:sub(3, 4), 16)
	local b = tonumber(hex:sub(5, 6), 16)
	return { r = r, g = g, b = b }
end

-- Функция для преобразования цвета (таблица {r, g, b}) в hex-строку (#RRGGBB)
local function rgbToHex(color)
	return string.format("#%02X%02X%02X", math.floor(color.r + 0.5), math.floor(color.g + 0.5), math.floor(color.b + 0.5))
end

-- Функция для создания градации между двумя hex-цветами
-- startHex, endHex - строки вида "#RRGGBB"
-- steps - количество шагов (минимум 2)
local function createHexColorGradient(startHex, endHex, steps)
	if steps < 2 then
		error("Количество шагов должно быть не меньше 2")
	end

	local startColor = hexToRGB(startHex)
	local endColor = hexToRGB(endHex)

	local obj = {}
	obj.gradient = {}

	for i = 1, steps do
		local t = (i - 1) / (steps - 1)
		local color = {
			r = lerp(startColor.r, endColor.r, t),
			g = lerp(startColor.g, endColor.g, t),
			b = lerp(startColor.b, endColor.b, t)
		}

		-- TODO to const
		obj["fg" .. i] = rgbToHex(color)
		obj["bg" .. (steps + 1 - i)] = rgbToHex(color)
	end

	return obj
end

local M = {}

M.createHexColorGradient = createHexColorGradient

return M
