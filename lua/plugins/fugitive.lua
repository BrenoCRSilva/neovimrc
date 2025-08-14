return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>|<cmd>10wincmd_<CR>")
		vim.keymap.set("n", "<leader>gP", "<cmd>Git pull --rebase<CR>")
		local FugitiveCfg = vim.api.nvim_create_augroup("FugitiveCfg", {})
		local autocmd = vim.api.nvim_create_autocmd
		autocmd("BufWinEnter", {
			group = FugitiveCfg,
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end

				local bufnr = vim.api.nvim_get_current_buf()
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set("n", "<leader>gp", function()
					vim.cmd.Git("push")
				end, opts)

				vim.keymap.set("n", "<leader>go", "<cmd>Git push -u origin<CR>", opts)
			end,
		})
	end,
}
