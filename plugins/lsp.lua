return {
    {
	"neovim/nvim-lspconfig",
	    config = function()
	    require("lspconfig").gopls.setup {}
        require("lspconfig").lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                        },
                    },
                },
            },
        }
	end,
    }
}
