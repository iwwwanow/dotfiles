local clear = require("plugins/theme/clear")
local highlights = require("plugins/theme/highlights")

local M = {}

function M.setup()
	clear.clear()
	highlights.setup()
end

-- TODO to functions
-- TODO как я вообще подключал эту тему
vim.api.nvim_create_user_command("ShowHlGroup", function()
  local line = vim.fn.line('.')
  local col = vim.fn.col('.')
  local syn_ids = vim.fn.synstack(line, col)
  -- Collect highlight group names from the syntax stack.
  local hl_groups = {}
  for _, id in ipairs(syn_ids) do
    local hl = vim.fn.synIDattr(id, 'name')
    if hl and hl ~= '' then
      table.insert(hl_groups, hl)
    end
  end
  if #hl_groups > 0 then
    print("Highlight группы под курсором: " .. table.concat(hl_groups, ", "))
  else
    print("Нет highlight групп под курсором.")
  end
end, {})

return M
