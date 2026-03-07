vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.o.cmdheight = 0
-- vim.cmd.colorscheme "catppuccin"

local icons = {
  [vim.diagnostic.severity.ERROR] = " ",
  [vim.diagnostic.severity.WARN]  = " ",
  [vim.diagnostic.severity.INFO]  = " ",
  [vim.diagnostic.severity.HINT]  = "󰌵 ",
}

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.INFO]  = " ",
      [vim.diagnostic.severity.HINT]  = "󰌵 ",
    },
  },
  virtual_text = {
    spacing = 4,
    source = "if_many",
    format = function(d)
      return (icons[d.severity] or "● ") .. d.message
    end,
  },
  float = {
    border = "rounded",
    source = "if_many",
    header = "",
    prefix = function(d)
      return icons[d.severity] or "● ", ""
    end,
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
