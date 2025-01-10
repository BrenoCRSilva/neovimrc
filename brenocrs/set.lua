vim.opt.shiftwidth = 4
vim.opt.nu = true
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.ruler = false
vim.api.nvim_set_hl(0, "@function.builtin", { fg="#eb6f92" })
vim.api.nvim_set_hl(0, "@type.builtin", { bold=true, fg="#9ccfd8" })
vim.api.nvim_set_hl(0, "@type", { bold=true, fg="#9ccfd8" })
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#eb6f92" })
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 50
vim.g.mapleader = " "
vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf"
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf"
  },
  cache_enable = 1,
}
