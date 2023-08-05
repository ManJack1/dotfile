return{
  

{
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first,
},
  'lervag/vimtex',

  'nvim-treesitter/nvim-treesitter',  
  {  
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config =function()
	    require('mason').setup()
    end
 },
  {
    event = "VeryLazy",
     "williamboman/mason-lspconfig.nvim",
  },
  {
    event = "VeryLazy",
    "neovim/nvim-lspconfig",
  },
  ------cmp
  {
   'neovim/nvim-lspconfig',
   'hrsh7th/cmp-nvim-lsp',
   'hrsh7th/cmp-buffer',
   'hrsh7th/cmp-path',
   'hrsh7th/cmp-cmdline',
   'hrsh7th/nvim-cmp',
    'f3fora/cmp-spell',
   'hrsh7th/nvim-lua',
-----lunarsnip
   'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

  },
  'preservim/nerdtree',
}

