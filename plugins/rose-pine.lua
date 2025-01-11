return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			variant = "moon",
			palette = {
				moon = {
					base = "#0c0b12",
					rose = "#ebbcba",
				},
			},
		})
		vim.cmd("colorscheme rose-pine")
		vim.api.nvim_set_hl(0, "@function.builtin", { fg = "#eb6f92" })
		vim.api.nvim_set_hl(0, "@type.builtin", { bold = true, fg = "#9ccfd8" })
		vim.api.nvim_set_hl(0, "HeaderA", { fg = "#c0c0c0" })
		vim.api.nvim_set_hl(0, "FooterA", { fg = "#6e6a86" })
	end,
}
