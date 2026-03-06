vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")

vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<cr>")
vim.keymap.set("n", "<leader>tl", "<cmd>tabnext<cr>")
vim.keymap.set("n", "<leader>th", "<cmd>tabprev<cr>")

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "rn", vim.lsp.buf.rename)

vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

vim.keymap.set("n", "gl", vim.diagnostic.open_float)

vim.keymap.set("n", "<leader>fo", "zo", { desc = "Fold open" })
vim.keymap.set("n", "<leader>fc", "zc", { desc = "Fold close" })
vim.keymap.set("n", "<leader>ft", "za", { desc = "Fold toggle" })

vim.keymap.set("n", "<leader>fO", "zR", { desc = "Fold open all" })
vim.keymap.set("n", "<leader>fC", "zM", { desc = "Fold close all" })

vim.keymap.set("n", "<C-l>", ":Neotree toggle<CR>", { noremap = true, silent = true })

vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })

vim.keymap.set("n", "<C-c>", function()
  local line = vim.api.nvim_get_current_line()
  vim.fn.setreg("+", line)

  vim.notify(
    string.format("Copied 1 line (%d chars) to clipboard", #line),
    vim.log.levels.INFO
  )
end, { desc = "Copy line to system clipboard" })

vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==")

vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv")
