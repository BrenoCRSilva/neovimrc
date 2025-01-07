vim.opt.completeopt = {"menu", "menuone", "noselect"}
vim.opt.shortmess:append "c"

local cmp = require("cmp")

cmp.setup {
    window = {
        completion = {
              winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
              col_offset = -3,
              side_padding = 0,
            },
    },
    sources = {
        {name = "nvim_lsp"},
        {name = "path"},
        {name = "buffer"},
    },
    mapping = {
        ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ["<CR>"] = cmp.mapping(
            cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            },
            { "i", "c"}
        ),
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
              local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
              local strings = vim.split(kind.kind, "%s", { trimempty = true })
              kind.kind = " " .. (strings[1] or "") .. " "
              kind.menu = "    (" .. (strings[2] or "") .. ")"
              return kind
            end,
   },
}

cmp.setup.filetype({ "sql"}, {
    sources = {
        { name = "vim-dadbod-completion"},
        { name = "buffer"},
    },
})

local ls = require("luasnip")
ls.config.set_config {
    history = false,
    updateevents = "TextChanged,TextChangedI",
}

vim.keymap.set( { "i", "s" }, "C-n", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set( { "i", "s" }, "C-p", function()
    if ls.expand_or_jumpable(-1) then
        ls.expand_or_jump(-1)
    end
end, { silent = true })

