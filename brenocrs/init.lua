require("brenocrs.set")
require("brenocrs.remap")
require("brenocrs.lazy")

vim.cmd([[
augroup HighlightYank
autocmd!
autocmd TextYankPost * lua vim.highlight.on_yank()
augroup end
]])
vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#191724" })
vim.api.nvim_set_hl(0, "GrappleNormal", { bg = "#191724" })
vim.api.nvim_set_hl(0, "GrappleBorder", { bg = "#191724", fg = "#eb6f92" })
vim.api.nvim_set_hl(0, "GrappleTitle", { bg = "#191724", fg = "#f6c177" })
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	pattern = "*",
	callback = function()
		vim.cmd("Trouble quickfix")
	end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "CursorMoved" }, {
	pattern = "*",
	callback = function()
		vim.cmd("echo ''")
	end,
})
