return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-]>",
      },
      ignore_filetypes = { "help", "TelescopePrompt" },
      color = {
        suggestion_color = "#ffffff",
        cterm = 244,
      },
    })
  end,
}

