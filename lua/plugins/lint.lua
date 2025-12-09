return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			lua = { "luacheck" },
			go = { "golangcilint" },
			typescript = { "eslint_d" },
			sql = { "sqlfluff" },
		}

		lint.linters.luacheck.args = { "vim" }
		lint.linters.sqlfluff.args = { "lint", "--format=json", "--dialect=clickhouse" }

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
