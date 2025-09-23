local M = {}

function M.setup()
  local colors = require("plugins/theme/colors").getColors()

  local function section(fg, bg, gui)
    return { fg = fg, bg = bg, gui = gui }
  end

  local dim_fg = colors.fg6
  local theme = {
    normal = {
      a = section(colors.fg, colors.bg_alt, "bold"),
      b = section(colors.fg, colors.bg),
      c = section(colors.fg3, colors.bg),
    },
    insert = {
      a = section(colors.fg, colors.bg_alt, "bold"),
      b = section(colors.fg, colors.bg),
      c = section(colors.fg3, colors.bg),
    },
    visual = {
      a = section(colors.fg, colors.bg_alt, "bold"),
      b = section(colors.fg, colors.bg),
      c = section(colors.fg3, colors.bg),
    },
    replace = {
      a = section(colors.fg, colors.bg_alt, "bold"),
      b = section(colors.fg, colors.bg),
      c = section(colors.fg3, colors.bg),
    },
    command = {
      a = section(colors.fg, colors.bg_alt, "bold"),
      b = section(colors.fg, colors.bg),
      c = section(colors.fg3, colors.bg),
    },
    inactive = {
      a = section(dim_fg, colors.bg, "bold"),
      b = section(dim_fg, colors.bg),
      c = section(dim_fg, colors.bg),
    },
  }

  require("lualine").setup({
    options = {
      theme = theme,
      section_separators = "",
      component_separators = "",
      icons_enabled = false,
    },
  })
end

return M
