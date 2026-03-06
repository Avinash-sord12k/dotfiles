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

vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = "●",
    severity = { min = vim.diagnostic.severity.WARN },
  },
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  }
})
