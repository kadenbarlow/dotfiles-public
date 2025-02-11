local cmp = require("cmp")
cmp.setup(
    {
        preselect = "item",
        completion = {
            completeopt = "menu,menuone,noinsert"
        },
        sources = {
            {name = "luasnip"},
            {name = "path"},
            {name = "nvim_lsp"},
            {name = "buffer"}
        },
        mapping = cmp.mapping.preset.insert(
            {
                ["<CR>"] = cmp.mapping.confirm({select = false}),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-l>"] = cmp.mapping(
                    function(fallback)
                        local luasnip = require("luasnip")
                        if luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end,
                    {"i", "s"}
                ),
                ["<C-h>"] = cmp.mapping(
                    function(fallback)
                        local luasnip = require("luasnip")
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end,
                    {"i", "s"}
                )
            }
        ),
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end
        }
    }
)
