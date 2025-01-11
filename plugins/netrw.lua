return {
	"prichrd/netrw.nvim",
	dependencies = {
		"echasnovski/mini.icons",
	},
	config = function()
		require("netrw").setup({
			use_devicons = true,
		})
	end,
}
