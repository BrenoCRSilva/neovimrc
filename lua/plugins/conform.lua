return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		local util = require("conform.util")

		local prettier_files = {
			".prettierrc",
			".prettierrc.json",
			".prettierrc.js",
			".prettierrc.cjs",
			".prettierrc.mjs",
			"prettier.config.js",
			"prettier.config.cjs",
			"prettier.config.mjs",
			".prettierignore",
		}

		local function has_prettier_config(filename)
			local found = vim.fs.find(prettier_files, { path = filename, upward = true })
			if #found > 0 then
				return true
			end

			local pkg = vim.fs.find("package.json", { path = filename, upward = true })[1]
			if not pkg then
				return false
			end

			local ok_read, lines = pcall(vim.fn.readfile, pkg)
			if not ok_read then
				return false
			end

			local ok_json, data = pcall(vim.json.decode, table.concat(lines, "\n"))
			return ok_json and type(data) == "table" and data.prettier ~= nil
		end

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofumpt", "goimports", "golines" },
				javascript = { "eslint_d", "prettier" },
				javascriptreact = { "eslint_d", "prettier" },
				typescript = { "eslint_d", "prettier" },
				typescriptreact = { "eslint_d", "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				python = { "black" },
			},
			formatters = {
				prettier = {
					cwd = util.root_file(vim.list_extend(vim.deepcopy(prettier_files), { "package.json", ".git" })),
					condition = function(_, ctx)
						return has_prettier_config(ctx.filename)
					end,
					prepend_args = { "--config-precedence", "prefer-file" },
				},
				eslint_d = {
					cwd = util.root_file({
						"eslint.config.js",
						"eslint.config.mjs",
						"eslint.config.cjs",
						".eslintrc",
						".eslintrc.js",
						".eslintrc.cjs",
						".eslintrc.json",
						"package.json",
						".git",
					}),
				},
			},
			format_on_save = function(bufnr)
				local ft = vim.bo[bufnr].filetype
				local no_lsp_fallback = {
					javascript = true,
					javascriptreact = true,
					typescript = true,
					typescriptreact = true,
				}

				return {
					lsp_format = no_lsp_fallback[ft] and "never" or "fallback",
					timeout_ms = 500,
				}
			end,
		})
	end,
}
