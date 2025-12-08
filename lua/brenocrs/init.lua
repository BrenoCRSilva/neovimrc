vim.g.mapleader = " "

if vim.g.vscode then
	-- VSCode/Cursor config
	require("brenocrs.set")
	require("brenocrs.remap")

	-- Thin cursor in insert mode (ver10 = 10% width)
	vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver10,r-cr-o:hor20"

	vim.cmd([[
        augroup HighlightYank
        autocmd!
        autocmd TextYankPost * lua vim.highlight.on_yank()
        augroup end
    ]])
else
	-- Regular Neovim
	require("brenocrs.set")
	require("brenocrs.remap")
	require("brenocrs.plugin-keymaps")
	require("brenocrs.lazy")

	vim.cmd([[
        augroup HighlightYank
        autocmd!
        autocmd TextYankPost * lua vim.highlight.on_yank()
        augroup end
    ]])

	vim.api.nvim_set_hl(0, "GrappleBorder", { fg = "#eb6f92" })
	vim.api.nvim_set_hl(0, "GrappleTitle", { fg = "#f6c177" })

	vim.api.nvim_create_autocmd("QuickFixCmdPost", {
		pattern = "*",
		callback = function()
			vim.cmd("Trouble quickfix")
		end,
	})

	vim.api.nvim_create_autocmd({ "InsertEnter", "CursorMoved" }, {
		pattern = "*",
		callback = function()
			vim.cmd("echo ''")
		end,
	})

	vim.api.nvim_create_user_command("AddGoTags", function(opts)
		require("brenocrs.go-tagger").add_tags(opts.line1 - 1, opts.line2)
	end, { range = true })

	vim.api.nvim_create_user_command("RemoveGoTags", function(opts)
		require("brenocrs.go-tagger").remove_tags(opts.line1 - 1, opts.line2)
	end, { range = true })
end
