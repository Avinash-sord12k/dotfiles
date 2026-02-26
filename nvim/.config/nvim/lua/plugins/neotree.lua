return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",

    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        position = "right", -- "left" | "right" | "float" | "current"
      },
      filesystem = {
        filtered_items = {
          visible = true,        -- hidden + filtered files dikhayega
          hide_dotfiles = false, -- dotfiles mat chhupao
          hide_gitignored = false, -- gitignored files bhi dikhao
        },
      },
    })
  end,
}

