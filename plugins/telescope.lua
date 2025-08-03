return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",

	dependencies = {
		"echasnovski/mini.icons",
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local actions = require("telescope.actions")
		local function send_to_trouble_quickfix(prompt_bufnr)
			actions.send_to_qflist(prompt_bufnr)
			require("trouble").open("quickfix")
		end
		require("telescope").setup({
			defaults = {
				mappings = {
					i = { ["<c-i>"] = send_to_trouble_quickfix },
					n = { ["<c-i>"] = send_to_trouble_quickfix },
				},
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
				},
			},
			extensions = {
				fzf = {},
			},
		})
		require("telescope").load_extension("fzf")
		vim.keymap.set("n", "<leader>ff", function()
			require("telescope.builtin").find_files({
				cwd = "~/",
			})
		end)
		vim.keymap.set("n", "<leader>fl", function()
			require("telescope.builtin").find_files({
				cwd = vim.uv.cwd(),
			})
		end)
		vim.keymap.set("n", "<leader>fb", function()
			local word = vim.fn.expand("<cword>")
			require("telescope.builtin").current_buffer_fuzzy_find({
				default_text = word,
			})
		end)
		vim.keymap.set("n", "<leader>fa", function()
			require("telescope.builtin").find_files({
				cwd = "~/",
				hidden = true,
			})
		end)
		vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
		vim.keymap.set("n", "<leader>fc", function()
			require("telescope.builtin").find_files({
				cwd = vim.fn.stdpath("config"),
			})
		end)
		vim.keymap.set("n", "<leader>fw", function()
			require("telescope.builtin").find_files({
				cwd = "~/Workspace/",
			})
		end)
		vim.keymap.set("n", "<leader>fs", function()
			local word = vim.fn.expand("<cword>")
			require("telescope.builtin").grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>fS", function()
			local word = vim.fn.expand("<cWORD>")
			require("telescope.builtin").grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>fg", function(opts)
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
	end,
}
