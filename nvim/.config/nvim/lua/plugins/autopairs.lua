return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    ------------------------------------------------------------------
    -- Autopairs setup
    ------------------------------------------------------------------
    local npairs = require("nvim-autopairs")
    npairs.setup()

    ------------------------------------------------------------------
    -- nvim-cmp integration
    ------------------------------------------------------------------
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")

    cmp.event:on(
      "confirm_done",
      cmp_autopairs.on_confirm_done()
    )
  end,
}
