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
        position = "right",
      },

      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },

        -- 🔥 AUTO FOLLOW CURRENT FILE (like VSCode)
        follow_current_file = {
          enabled = true,
        },
      },
    })

    -- 🔥 KEYMAP: Reveal current file + focus Neo-tree
    vim.keymap.set("n", "<leader>ee", function()
      require("neo-tree.command").execute({
        action = "focus",
        source = "filesystem",
        position = "right",
        reveal = true,
      })
    end, { desc = "Reveal current file in Neo-tree" })
  end,
}
