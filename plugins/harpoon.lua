return {
	"ThePrimeagen/harpoon",

	config = function()
		vim.keymap.set("n", "<leader>a", require("harpoon.mark").add_file)
		vim.keymap.set("n", "<leader>e", require("harpoon.ui").toggle_quick_menu)
		vim.keymap.set("n", "<C-l>", require("harpoon.ui").nav_next)
		vim.keymap.set("n", "<C-h>", require("harpoon.ui").nav_prev)
	end,
}
