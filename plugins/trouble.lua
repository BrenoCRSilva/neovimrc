return {
	"folke/trouble.nvim",
	opts = {
		modes = {
			quickfix = {
				auto_open = false,
				auto_close = false,
				focus = true,
				group = false, -- Explicitly disable grouping for quickfix (flat list)
				indent_lines = false, -- No indentation for flat list
				keys = {
					["<cr>"] = "jump", -- Jump to selected item
					["<esc>"] = "close", -- Close with Esc
					["<C-N>"] = { action = "next", focus = true }, -- Jump to next, focus buffer
					["<C-P>"] = { action = "prev", focus = true },
				},
			}, -- for default options, refer to the configuration section for custom setup.
			diagnostics = {
				auto_open = false,
				auto_close = false,
				focus = true,
				group = false, -- Explicitly disable grouping for quickfix (flat list)
				indent_lines = false, -- No indentation for flat list
				keys = {
					["<cr>"] = "jump", -- Jump to selected item
					["<esc>"] = "close", -- Close with Esc
					["<C-n>"] = { action = "next", focus = true }, -- Jump to next, focus buffer
					["<C-p>"] = { action = "prev", focus = true },
				},
			},
		},
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>cq",
			function()
				vim.fn.setqflist({})
				require("trouble").refresh({ mode = "quickfix" })
			end,
		},
		{
			"<leader>ta",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>tt",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cc",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
}
