require("brenocrs.set")
require("brenocrs.remap")
require("brenocrs.lazy")

vim.cmd([[
augroup HighlightYank
autocmd!
autocmd TextYankPost * lua vim.highlight.on_yank()
augroup end
]])
