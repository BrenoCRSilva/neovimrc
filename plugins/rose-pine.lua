return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
        require("rose-pine").setup({
            transparent = true,
            variant = "moon",
            palette = {
                moon = {
                    base = "#0c0b12",
                    rose = "#ebbcba",
                }
            }
        })
		vim.cmd("colorscheme rose-pine")

	end
}
