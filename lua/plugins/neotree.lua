return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("neo-tree").setup({
				filesystem = {
					filtered_items = {
						visible = true, -- Show hidden files by default
						hide_dotfiles = false,
						hide_gitignored = false,
					},
					follow_current_file = {
						enabled = true,
					},
				},
				default_component_configs = {
					indent = {
						expander_collapsed = "",
						expander_expanded = "",
					},
				},
			})
		end,
	},
}
