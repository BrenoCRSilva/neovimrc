-- ============================================
-- PLUGIN KEYMAPS (wrapped in autocommands)
-- ============================================

-- Oil
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyLoad",
	callback = function(event)
		if event.data == "oil.nvim" then
			vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>")
		end
	end,
})

-- Noice
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyLoad",
	callback = function(event)
		if event.data == "noice.nvim" then
			vim.keymap.set("n", "<leader>nl", "<cmd>Noice<CR>")
		end
	end,
})

-- Undotree
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyLoad",
	callback = function(event)
		if event.data == "undotree" then
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end
	end,
})

-- Grapple
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyLoad",
	callback = function(event)
		if event.data == "grapple.nvim" then
			vim.keymap.set("n", "<leader>a", "<cmd>Grapple toggle<cr>")
			vim.keymap.set("n", "<leader>e", "<cmd>Grapple toggle_tags<cr>")
			vim.keymap.set("n", "<leader>1", "<cmd>Grapple select index=1<cr>")
			vim.keymap.set("n", "<leader>2", "<cmd>Grapple select index=2<cr>")
			vim.keymap.set("n", "<leader>3", "<cmd>Grapple select index=3<cr>")
			vim.keymap.set("n", "<leader>4", "<cmd>Grapple select index=4<cr>")
			vim.keymap.set("n", "<leader>5", "<cmd>Grapple select index=5<cr>")
		end
	end,
})

-- Telescope
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyLoad",
	callback = function(event)
		if event.data == "telescope.nvim" then
			vim.keymap.set("n", "<leader>fa", function()
				require("telescope.builtin").find_files({ cwd = "~/", hidden = true })
			end)
			vim.keymap.set("n", "<leader>ff", function()
				require("telescope.builtin").find_files({ cwd = vim.uv.cwd() })
			end)
			vim.keymap.set("n", "<leader>fh", function()
				require("telescope.builtin").help_tags({})
			end)
			vim.keymap.set("n", "<leader>fc", function()
				require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
			end)
			vim.keymap.set("n", "<leader>fb", function()
				local word = vim.fn.expand("<cword>")
				local current_file = vim.fn.expand("%:p")
				require("telescope.builtin").grep_string({ search = word, search_dirs = { current_file } })
			end)
			vim.keymap.set("n", "<leader>fw", function()
				local word = vim.fn.expand("<cword>")
				require("telescope.builtin").grep_string({ search = word })
			end)
			vim.keymap.set("n", "<leader>fW", function()
				local word = vim.fn.expand("<cWORD>")
				require("telescope.builtin").grep_string({ search = word })
			end)
			vim.keymap.set("n", "<leader>fg", function(opts)
				opts = opts or {}
				local current_file = vim.fn.expand("%:p")

				if current_file == "" then
					vim.notify("No file in current buffer", vim.log.levels.WARN)
					return
				end

				local pickers = require("telescope.pickers")
				local finders = require("telescope.finders")
				local make_entry = require("telescope.make_entry")
				local conf = require("telescope.config").values

				local finder = finders.new_async_job({
					command_generator = function(prompt)
						if not prompt or prompt == "" then
							return nil
						end

						return {
							"rg",
							"-e",
							prompt,
							current_file,
							"--color=never",
							"--no-heading",
							"--with-filename",
							"--line-number",
							"--column",
							"--smart-case",
						}
					end,
					entry_maker = make_entry.gen_from_vimgrep(opts),
					cwd = vim.fn.fnamemodify(current_file, ":h"),
				})

				pickers
					.new(opts, {
						debounce = 100,
						prompt_title = "Grep (Current Buffer)",
						finder = finder,
						previewer = conf.grep_previewer(opts),
						sorter = require("telescope.sorters").empty(),
					})
					:find()
			end)
			vim.keymap.set("n", "<leader>fG", function(opts)
				opts = opts or {}
				opts.cwd = opts.cwd or vim.uv.cwd()
				local pickers = require("telescope.pickers")
				local finders = require("telescope.finders")
				local make_entry = require("telescope.make_entry")
				local conf = require("telescope.config").values
				local finder = finders.new_async_job({
					command_generator = function(prompt)
						if not prompt or prompt == "" then
							return nil
						end
						local pieces = vim.split(prompt, "  ")
						local args = { "rg" }
						if pieces[1] then
							table.insert(args, "-e")
							table.insert(args, pieces[1])
						end
						if pieces[2] then
							table.insert(args, "-g")
							table.insert(args, pieces[2])
						end
						return vim.tbl_flatten({
							args,
							{
								"--color=never",
								"--no-heading",
								"--with-filename",
								"--line-number",
								"--column",
								"--smart-case",
							},
						})
					end,
					entry_maker = make_entry.gen_from_vimgrep(opts),
					cwd = opts.cwd,
				})
				pickers
					.new(opts, {
						debounce = 100,
						prompt_title = "Multi Grep",
						finder = finder,
						previewer = conf.grep_previewer(opts),
						sorter = require("telescope.sorters").empty(),
					})
					:find()
			end)
		end
	end,
})

-- Fugitive
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyLoad",
	callback = function(event)
		if event.data == "vim-fugitive" then
			vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>|<cmd>10wincmd_<CR>")
			vim.keymap.set("n", "<leader>gb", function()
				vim.cmd("Git branch")
				vim.cmd("10wincmd_")

				local branch = vim.fn.input("Branch name (new or existing): ")
				vim.cmd("close")

				if branch ~= "" then
					-- Check if branch exists
					local branch_exists = vim.fn.system("git rev-parse --verify " .. branch .. " 2>/dev/null")

					if vim.v.shell_error == 0 then
						vim.cmd("Git checkout " .. branch)
						vim.notify("Checked out existing branch: " .. branch, vim.log.levels.INFO)
					else
						vim.cmd("Git checkout -b " .. branch)
						vim.notify("Created and checked out new branch: " .. branch, vim.log.levels.INFO)
					end
				end
			end)
			vim.keymap.set("n", "<leader>gP", "<cmd>Git pull --rebase<CR>")

			-- Fugitive buffer-specific keymaps
			local FugitiveCfg = vim.api.nvim_create_augroup("FugitiveCfg", {})
			vim.api.nvim_create_autocmd("BufWinEnter", {
				group = FugitiveCfg,
				pattern = "*",
				callback = function()
					if vim.bo.ft ~= "fugitive" then
						return
					end
					local bufnr = vim.api.nvim_get_current_buf()
					local opts = { buffer = bufnr, remap = false }

					vim.keymap.set("n", "<leader>gp", function()
						vim.cmd.Git("push")
					end, opts)
					vim.keymap.set("n", "<leader>go", "<cmd>Git push -u origin HEAD<CR>", opts)
				end,
			})
		end
	end,
})

-- Trouble
local current_trouble_mode = nil

vim.api.nvim_create_autocmd("User", {
	pattern = "LazyLoad",
	callback = function(event)
		if event.data == "trouble.nvim" then
			local trouble = require("trouble")

			local function toggle_exclusive(mode)
				if trouble.is_open() and current_trouble_mode == mode then
					trouble.close()
					current_trouble_mode = nil
				else
					if trouble.is_open() then
						trouble.close()
					end
					trouble.open(mode)
					current_trouble_mode = mode
				end
			end

			vim.keymap.set("n", "<C-n>", function()
				if trouble.is_open() then
					trouble.next({ skip_groups = true, jump = true })
				end
			end)
			vim.keymap.set("n", "<C-p>", function()
				if trouble.is_open() then
					trouble.prev({ skip_groups = true, jump = true })
				end
			end)
			vim.keymap.set("n", "<leader>cq", function()
				vim.fn.setqflist({})
				trouble.refresh({ mode = "quickfix" })
			end)
			vim.keymap.set("n", "<leader>tt", function()
				toggle_exclusive("diagnostics")
			end)
			vim.keymap.set("n", "<leader>th", function()
				toggle_exclusive("buffer_diagnostics")
			end)
			vim.keymap.set("n", "<leader>tf", function()
				toggle_exclusive("quickfix")
			end)
		end
	end,
})

-- UFO (folding)
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyLoad",
	callback = function(event)
		if event.data == "nvim-ufo" then
			vim.keymap.set("n", "<leader>do", function()
				require("ufo").openAllFolds()
			end)
			vim.keymap.set("n", "<leader>df", function()
				require("ufo").closeAllFolds()
			end)
			vim.keymap.set("n", "<leader>dt", "za")
			vim.keymap.set("n", "<leader>da", function()
				local ufo = require("ufo")
				if vim.wo.foldlevel == 0 then
					ufo.openAllFolds()
				else
					ufo.closeAllFolds()
				end
			end)
		end
	end,
})

-- Neo-tree
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyLoad",
	callback = function(event)
		if event.data == "neo-tree.nvim" then
			vim.keymap.set("n", "<leader>nt", "<cmd>Neotree toggle<cr>")
		end
	end,
})

-- Go tags (filetype-specific)
vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.keymap.set("v", "<leader>tg", ":AddGoTags<CR>", { silent = true, buffer = true })
		vim.keymap.set("v", "<leader>tgr", ":RemoveGoTags<CR>", { silent = true, buffer = true })
	end,
})

-- Linting (uses vim.fn.input, only in regular Neovim)
vim.keymap.set("n", "<leader>lf", function()
	local dialect = vim.fn.input("SQL Dialect: ", "clickhouse")
	if dialect ~= "" then
		vim.cmd("!sqlfluff fix --dialect=" .. dialect .. " %")
		vim.cmd("e!") -- Reload the file after fixing
	end
end, { desc = "SQLFluff fix with dialect" })
