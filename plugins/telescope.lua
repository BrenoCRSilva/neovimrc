return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',

    dependencies = {
    'echasnovski/mini.icons',
	'nvim-lua/plenary.nvim' ,
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        require("telescope").setup {
            defaults = {
                    sorting_strategy = "ascending",
                    layout_config = {
                        prompt_position = "top",
                    }
            },
            extensions = {
                fzf = {}
            }
        }
        require("telescope").load_extension("fzf")
        vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
        vim.keymap.set("n", "<leader>fa", function ()
            require("telescope.builtin").find_files {
                hidden = true
            }
        end)
        vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
        vim.keymap.set("n", "<leader>fc", function()
            require("telescope.builtin").find_files {
                cwd = vim.fn.stdpath("config")
            }
        end)
        vim.keymap.set("n", "<leader>fw", function()
            require("telescope.builtin").find_files {
                cwd = "~/Workspace/"
            }
        end)


    end
}
