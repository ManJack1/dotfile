return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup()
  end,
  keys = {
    { "L", "<cmd>CompilerOpen<cr>", desc = "CompilerOpen" },
    { "T", "<cmd>CompilerToggleResults<cr>", desc = "CompilerToggleResults" },
  },
}
