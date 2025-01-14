return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason_lspconfig = require("mason-lspconfig")
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"gopls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"stylua", -- lua formatter
				"gofumpt",
				"golines",
				"goimports",
				"gomodifytags",
			},
		})
	end,
}
