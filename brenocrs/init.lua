require("brenocrs.set")
require("brenocrs.remap")
require("brenocrs.lazy")

vim.cmd([[
augroup HighlightYank
autocmd!
autocmd TextYankPost * lua vim.highlight.on_yank()
augroup end
]])
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#eb6f92" })
vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#191724" })
