return {

  "L3MON4D3/LuaSnip",
  keys = function()
    return {}
  end,
  config = function()
    local ls = require("luasnip")
    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim.bak/nvim/lua/Snippet" })
    ls.config.setup({ enable_autosnippets = true })
  end,
}
