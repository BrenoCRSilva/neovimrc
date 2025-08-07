vim.opt.shiftwidth = 4
vim.opt.nu = true
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.virtualedit = "block"
vim.opt.softtabstop = 4
vim.opt.updatetime = 100
vim.opt.pumblend = 10
vim.opt.winblend = 10
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.ruler = false
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.mapleader = " "
vim.opt.shell = os.getenv("SHELL")
vim.g.clipboard = {
	name = "win32yank-wsl",
	copy = {
		["+"] = "win32yank.exe -i --crlf",
		["*"] = "win32yank.exe -i --crlf",
	},
	paste = {
		["+"] = "win32yank.exe -o --lf",
		["*"] = "win32yank.exe -o --lf",
	},
	cache_enable = 1,
}
