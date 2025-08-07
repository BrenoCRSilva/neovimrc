return {
	"altermo/ultimate-autopair.nvim",
	event = { "InsertEnter", "CmdlineEnter" },
	config = function()
		require("ultimate-autopair").setup({
			fastwarp = {
				multi = true,
				{},
				{ faster = true, map = "<C-e>", cmap = "<C-e>", rmap = "<C-E>", rcmap = "<C-E>" },
			},

			tabout = {
				enable = true,
				map = "<C-l>",
				cmap = "<C-l>",
				hopout = true,
			},
		})
	end,
}
