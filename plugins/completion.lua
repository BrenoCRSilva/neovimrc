return {
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		priority = 100,
		dependencies = {
			"xzbdmw/colorful-menu.nvim",
			"onsails/lspkind.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")

			local luasnip = require("luasnip")

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				view = {
					docs = {
						auto_open = false,
					},
				},
				window = {
					completion = {
						winhighlight = "Normal:CmpNormal,FloatBorder:CmpNormal,Search:None",
						col_offset = -3,
						side_padding = 0,
					},
					documentation = {
						winhighlight = "Normal:CmpNormal,FloatBorder:CmpNormal,Search:None",
					},
				},
				preselect = cmp.PreselectMode.None,
				completion = {
					completeopt = "menu,menuone,preview,noinsert",
				},
				snippet = { -- configure how nvim-cmp interacts with snippet engine
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
					["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-g>"] = function()
						if cmp.visible_docs() then
							cmp.close_docs()
						else
							cmp.open_docs()
						end
					end,
				}),
				-- sources for autocompletion
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- snippets
					{ name = "buffer" }, -- text within current buffer
					{ name = "path" }, -- file system paths
				}),

				-- configure lspkind for vs-code like pictograms in completion menu
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local kind = require("lspkind").cmp_format({
							mode = "symbol_text",
							maxwidth = 50,
							symbol_map = { Copilot = "" },
						})(entry, vim_item)
						local highlights_info = require("colorful-menu").cmp_highlights(entry)
						local strings = vim.split(kind.kind, "%s", { trimempty = true })
						if highlights_info ~= nil then
							kind.abbr_hl_group = highlights_info.highlights
							kind.abbr = highlights_info.text
						end
						kind.kind = " " .. (strings[1] or "") .. " "
						kind.menu = "    (" .. (strings[2] or "") .. ")"
						return kind
					end,
				},
				{ name = "copilot" },
			})
		end,
	},
}
