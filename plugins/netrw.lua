return {
    'prichrd/netrw.nvim',
    opts = {},
    config = function()
        require("netrw").setup({
            use_devicons = true,
        })
    end
}
