local modes = require("modes")

modes.add_binds("normal", {
	{
		"<Control-c>",
		"Copy selected text.",
		function()
			luakit.selection.clipboard = luakit.selection.primary
		end,
	},
})

modes.remap_binds("normal", {
	{ "<shift-j>", "gT", true },
	{ "<shift-k>", "gt", true },
})
