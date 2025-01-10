require("brenocrs.set")
require("brenocrs.remap")
require("brenocrs.lazy")

vim.cmd([[
augroup HighlightYank
autocmd!
autocmd TextYankPost * lua vim.highlight.on_yank()
augroup end
]])

vim.cmd([[
augroup MyColors
autocmd!
autocmd ColorScheme * highlight MiniIconsAzure guifg=#007fff
autocmd ColorScheme * highlight MiniIconsBlue guifg=#0000ff
autocmd ColorScheme * highlight MiniIconsCyan guifg=#00ffff
autocmd ColorScheme * highlight MiniIconsGreen guifg=#00ff00
autocmd ColorScheme * highlight MiniIconsGrey guifg=#808080
autocmd ColorScheme * highlight MiniIconsOrange guifg=#ffa500
autocmd ColorScheme * highlight MiniIconsRed guifg=#ff0000
autocmd ColorScheme * highlight MiniIconsYellow guifg=#ffff00
autocmd ColorScheme * highlight MiniIconsPurple guifg=#800080
autocmd ColorScheme * highlight DashboardHeader guifg=#ffffff
augroup end
]])
