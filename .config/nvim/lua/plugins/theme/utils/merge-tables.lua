local M = {}

function M.mergeTables(...)
	local result = {}
	for _, tbl in ipairs({ ... }) do
		for key, value in pairs(tbl) do
			result[key] = value
		end
	end
	return result
end

return M
