vim.g.mapleader = " "

-- editor
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<S-H>", ":bprev<CR>")
vim.keymap.set("n", "<S-L>", ":bnext<CR>")

-- cyberdream
vim.api.nvim_set_keymap("n", "<leader>tt", ":CyberdreamToggleMode<CR>", { noremap = true, silent = true })

