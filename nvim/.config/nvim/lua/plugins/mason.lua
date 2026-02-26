return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "ts_ls",
          "html",
          "cssls",
          "tailwindcss",
          "lua_ls",
        },
      })
    end,
  },
}

