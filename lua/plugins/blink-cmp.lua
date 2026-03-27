return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"fang2hou/blink-copilot",
			"Exafunction/codeium.nvim",
			{ "L3MON4D3/LuaSnip", version = "v2.*" },
		},
		opts = {
			fuzzy = {
				frecency = {
					enabled = true,
				},
				use_proximity = true,
				max_items = 50,
				sorts = { "score", "sort_text" },
				prebuilt_binaries = {
					download = true,
				},
			},
			trigger = {
				completion = {
					debounce = 80,
					throttle = 40,
				},
			},
			keymap = {
				preset = "none",
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<C-Space>"] = { "accept", "fallback" },
				["<C-h>"] = { "show", "show_documentation", "hide_documentation", "fallback" },
			},
			cmdline = {
				keymap = { preset = "inherit" },
				completion = { menu = { auto_show = true } },
			},
			sources = {
				default = { "copilot", "lsp", "path", "snippets", "buffer", "markview" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-copilot",
						score_offset = 70,
						async = true,
						debounce = 250,
						transform_items = function(_, items)
							-- Limit copilot results to top 5
							return vim.list_slice(items, 1, 5)
						end,
					},
				},
			},
			completion = {
				documentation = {
					auto_show = false,
					window = {
						render = function(bufnr)
							require("markview").attach(bufnr)
						end,
						border = "single",
						max_width = 80,
						max_height = 20,
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
					},
				},
				list = {
					selection = {
						auto_insert = false,
					},
				},
				menu = {
					border = "single",
					direction_priority = function()
						local ctx = require("blink.cmp").get_context()
						local item = require("blink.cmp").get_selected_item()
						if ctx == nil or item == nil then
							return { "s", "n" }
						end
						local item_text = item.textEdit ~= nil and item.textEdit.newText
							or item.insertText
							or item.label
						local is_multi_line = item_text:find("\n") ~= nil
						if is_multi_line or vim.g.blink_cmp_upwards_ctx_id == ctx.id then
							vim.g.blink_cmp_upwards_ctx_id = ctx.id
							return { "n", "s" }
						end
						return { "s", "n" }
					end,
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind", gap = 1 },
						},
					},
				},
				ghost_text = {
					enabled = true,
				},
			},
			snippets = { preset = "luasnip" },
		},
		opts_extend = { "sources.default" },
	},
}
