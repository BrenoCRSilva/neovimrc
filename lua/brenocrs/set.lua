-- Leader key (must be set before plugins load)
vim.g.mapleader = " "

-- ============================================
-- EDITOR BEHAVIOR
-- ============================================

-- Line numbers
vim.o.nu = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.cursorlineopt = "number"

-- Indentation
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- Search
vim.o.hlsearch = false

-- Scrolling & viewport
vim.o.scrolloff = 8
vim.o.wrap = false
vim.o.virtualedit = "block"

-- UI & appearance
vim.o.termguicolors = true
vim.o.ruler = false
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- Performance
vim.o.updatetime = 50

-- ============================================
-- FILE MANAGEMENT
-- ============================================

vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.nvim/undodir"

-- ============================================
-- FOLDING (UFO)
-- ============================================

vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- ============================================
-- CLIPBOARD (Wayland)
-- ============================================

vim.o.clipboard = "unnamedplus"
vim.g.clipboard = {
	name = "wl-clipboard",
	copy = {
		["+"] = "wl-copy",
		["*"] = "wl-copy",
	},
	paste = {
		["+"] = "wl-paste --no-newline",
		["*"] = "wl-paste --no-newline",
	},
	cache_enable = 0,
}

-- ============================================
-- SHELL
-- ============================================

vim.o.shell = os.getenv("SHELL")

-- ============================================
-- PLUGIN CONFIGURATION
-- ============================================

-- Undotree
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_DiffpanelHeight = 0

-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
