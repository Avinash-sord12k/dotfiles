return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      signcolumn = true, -- sign column me git signs
      numhl = true,      -- number highlight enabled
      linehl = false,    -- line highlight disabled
      word_diff = false, -- word diff disabled

      watch_gitdir = {
        follow_files = true,
      },

      on_attach = function(bufnr)
        local gs = require("gitsigns")

        local function map(mode, lhs, rhs, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- Hunk navigation
        map("n", "]c", function()
          gs.next_hunk()
        end)

        map("n", "[c", function()
          gs.prev_hunk()
        end)

        -- Stage / reset hunks
        map("n", "<leader>gs", gs.stage_hunk)
        map("v", "<leader>gs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)

        map("n", "<leader>gr", gs.reset_hunk)
        map("v", "<leader>gr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)

        -- Preview hunk diff
        map("n", "<leader>gp", gs.preview_hunk)

        -- Full blame for current line
        map("n", "<leader>gB", function()
          gs.blame_line({ full = true })
        end)
      end,
    })
  end,
}

