return {
	"folke/trouble.nvim",
	config = function()
		local trouble = require("trouble")
		trouble.setup({
			modes = {
				buffer_diagnostics = {
					mode = "diagnostics",
					auto_open = false,
					auto_close = true,
					focus = false,
					group = false,
					indent_lines = false,
					filter = { buf = 0 },
					keys = {
						["<cr>"] = "jump",
						["<esc>"] = "close",
					},
				},
				quickfix = {
					auto_open = false,
					auto_close = true,
					focus = false,
					group = false,
					indent_lines = false,
					keys = {
						["<cr>"] = "jump",
						["<esc>"] = "close",
					},
				},
				diagnostics = {
					auto_open = false,
					auto_close = true,
					focus = false,
					group = false,
					indent_lines = false,
					keys = {
						["<cr>"] = "jump",
						["<esc>"] = "close",
					},
				},
			},
		})
	end,
}
