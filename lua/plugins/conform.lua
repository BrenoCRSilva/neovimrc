return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				sql = { "sleek" },
				go = { "gofumpt", "goimports", "golines" },
				typescript = { "prettier", "eslint" },
				python = { "black" },
			},
			formatters = {
				sleek = {
					command = "sleek",
					args = { "--indent-spaces=2", "--lines-between-queries=3" },
				},
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		})
	end,
}
