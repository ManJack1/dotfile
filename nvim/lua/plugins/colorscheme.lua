return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    integrations = {
      nvimtree = true,
      ts_rainbow = true,
      aerial = true,
      dap = { enabled = true, enable_ui = true },
      mason = true,
      neotree = true,
      notify = true,
      semantic_tokens = true,
      symbols_outline = true,
      telescope = true,
      which_key = true,
    },
  },
}
