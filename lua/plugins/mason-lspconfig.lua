return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
		"neovim/nvim-lspconfig",
		"WhoIsSethDaniel/mason-tool-installer",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		vim.diagnostic.config({
			severity_sort = true,
			virtual_text = {
				virt_text_pos = "eol",
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
		})

		local on_attach = function(client, bufnr)
			vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

			local telescope = require("telescope.builtin")
			local map = vim.keymap.set

			map("n", "<leader>fr", telescope.lsp_references)
			map("n", "<leader>fi", telescope.lsp_implementations)
			map("n", "<leader>rn", vim.lsp.buf.rename)
			map("n", "gD", vim.lsp.buf.declaration)
			map("n", "gd", vim.lsp.buf.definition)
			map("n", "K", vim.lsp.buf.hover)
		end

		vim.lsp.config("gopls", {
			on_attach = on_attach,
		})

		vim.lsp.config("postgres_lsp", {
			on_attach = on_attach,
			cmd = { "postgrestools", "lsp-proxy" },
			filetypes = { "sql" },
			single_file_support = true,
		})

		vim.lsp.config("lua_ls", {
			on_attach = on_attach,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		vim.lsp.config("ts_ls", {
			on_attach = on_attach,
		})

		vim.lsp.config("bashls", {
			cmd = { "bash-language-server", "start" },
			filetypes = { "bash", "sh" },
		})

		require("mason-tool-installer").setup({

			ensure_installed = {
				{ "bash-language-server", auto_update = true },
				"shellcheck",
				"golangci-lint",
				"goimports",
				"gofumpt",
				"golines",
				"gomodifytags",
				"gotests",
				"prettier",
				"eslint",
				"postgrestools",
				"stylua",
				"luacheck",
			},
		})

		require("mason-lspconfig").setup({
			vim.lsp.enable("postgres_lsp"),
			automatic_enabled = true,
			ensure_installed = {
				"lua_ls",
				"pyright",
				"gopls",
				"ts_ls",
			},
		})
	end,
}
