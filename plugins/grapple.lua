return {
	"cbochs/grapple.nvim",
	dependencies = {
		{ "echasnovski/mini.icons", lazy = true },
	},
	config = function()
		local strings = require("utils.strings")
		require("grapple").setup({
			scope = "git",
			icons = true,
			status = false,
			tag_title = function()
				local cwd = vim.fn.getcwd()
				local dir_name = vim.fn.fnamemodify(cwd, ":t")
				return strings.titlecase(dir_name)
			end,
			win_opts = {
				footer = "",
			},
		})
	end,
	keys = {
		{ "<leader>a", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
		{ "<leader>e", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },

		{ "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
		{ "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
		{ "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
		{ "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
		{ "<leader>5", "<cmd>Grapple select index=5<cr>", desc = "Select fifth tag" },
	},
}
