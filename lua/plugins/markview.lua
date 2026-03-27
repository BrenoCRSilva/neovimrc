-- For `plugins/markview.lua` users.
return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	opts = {
		preview = {
			modes = { "n", "no", "c", "i" },
			hybrid_modes = { "i" },
			linewise_hybrid_mode = true,
			ignore_buftypes = {}, -- default may include "nofile", clear it
		},
	},
}
