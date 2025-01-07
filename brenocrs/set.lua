vim.opt.shiftwidth = 4
vim.opt.nu = true
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.api.nvim_set_hl(0, "@function.builtin", { fg="#eb6f92" })
vim.api.nvim_set_hl(0, "@type.builtin", { bold=true, fg="#9ccfd8" })
vim.api.nvim_set_hl(0, "@type", { bold=true, fg="#9ccfd8" })
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
