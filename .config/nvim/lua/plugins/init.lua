return {
{
    				"Mofiqul/adwaita.nvim",
    lazy = false,
    priority = 1000,
    
    -- configure and set on startup
    config = function()
        vim.g.adwaita_darker = false             -- for darker version
        vim.g.adwaita_disable_cursorline = false -- to disable cursorline
        vim.g.adwaita_transparent = false        -- makes the background transparent
        vim.cmd('colorscheme adwaita')
    end
},
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.lualine").setup({
    options = {
        -- ...
        theme = "adwaita",
        -- ...
    },
})
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("plugins/nvim-ts-context-commentstring")
    end,
  },
  {
    "terrortylor/nvim-comment",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      require("plugins/nvim-comment")
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "tpope/vim-surround",
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    config = function()
      require("plugins/telescope")
    end,
  },
  {
    "lbrayner/vim-rzip",
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins/oil")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("plugins.cmp").setup()
    end,
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("plugins.mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("plugins.lsp").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("plugins/treesitter")
    end,
  },
  {
    "luckasRanarison/tree-sitter-hypr",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
}
