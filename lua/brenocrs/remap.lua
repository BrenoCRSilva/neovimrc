-- ============================================
-- CORE KEYMAPS (no plugin dependencies)
-- ============================================

-- File operations
vim.keymap.set("n", "<leader>s", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>q!<CR>")

-- Movement and editing
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set(
	{ "n", "x" },
	"n",
	[[@/ == '' ? ':echo "/ is empty"<Cr>' : 'n']],
	{ expr = true, noremap = true, silent = true }
)

-- Replace word (only in regular Neovim, not VSCode)
if not vim.g.vscode then
	vim.keymap.set("n", "<leader>rw", function()
		local replace_word = vim.fn.input("Replace word: ")
		if replace_word == "" then
			return
		end

		local escaped = vim.fn.escape(replace_word, "/\\.*$^~[]")

		-- Match word that's bounded by non-alphanumeric chars
		-- \zs and \ze mark start/end of match (don't include boundaries in match)
		local pattern = "\\([^a-zA-Z0-9]\\|^\\)\\zs" .. escaped .. "\\ze\\([^a-zA-Z0-9]\\|$\\)"

		vim.fn.setreg("/", pattern)
		vim.o.hlsearch = true
		vim.cmd("redraw")

		local target_word = vim.fn.input("With word: ")
		if target_word == "" then
			return
		end

		vim.cmd("%s/" .. pattern .. "/" .. target_word .. "/gI")
		vim.fn.setreg("/", "")
		vim.o.hlsearch = false
	end, { desc = "Replace Word" })
end

-- Window management
vim.keymap.set("n", "<leader>wo", "<C-w>o")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wh", "<C-w>h")

-- Movement remaps
vim.keymap.set({ "n", "o", "v" }, "*", "^")
vim.keymap.set({ "n", "o", "v" }, "$", "g_")
