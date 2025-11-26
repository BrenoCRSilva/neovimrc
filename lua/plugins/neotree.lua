return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required: utility functions
			"MunifTanjim/nui.nvim", -- Required: UI components
			"nvim-tree/nvim-web-devicons", -- Optional: file icons
		},
		keys = {
			{ "<leader>nt", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
		},
	},
}
