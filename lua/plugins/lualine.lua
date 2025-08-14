return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		require("lualine").setup({
			options = {
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				theme = "auto",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "grapple" },
				lualine_c = {
					{
						"filename",
						path = 1,
						fmt = function(str)
							local result = string.gsub(str, "^oil:///", "")
							result = string.gsub(result, "^home", "~")
							return result
						end,
					},
				},
				lualine_x = { "diagnostics" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
