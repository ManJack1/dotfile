require("mason-nvim-dap").setup({
  ensure_installed = { "javatest" },
  automatic_installation = true,
  handlers = {
    function(config)
      require("mason-nvim-dap").default_setup(config)
    end,
  },
})
