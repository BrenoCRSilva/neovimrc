return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		input = {
			enabled = true,
		},
		styles = {
			input = {
				width = 30,
				relative = "cursor",
				row = -3,
				col = 0,
			},
		},
	},
}
