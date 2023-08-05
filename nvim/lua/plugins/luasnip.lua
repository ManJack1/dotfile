return {
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "plugins.configs.luasnip" (plugin, opts)                                                  -- include the default astronvim config that calls the setup call
      require("luasnip.loaders.from_lua").load({ paths = "/Users/luoyaohui/.config/nvim/lua/Snippet" }) -- load snippets paths
      require("luasnip").config.set_config({                                                            -- Setting LuaSnip config

        -- Enable autotriggered snippets
        enable_autosnippets = true,

        -- Use Tab (or some other key if you prefer) to trigger visual selection
        store_selection_keys = "<Tab>",
      })
      vim.cmd [[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]
    end,
  },
}
