vim.keymap.set("n", "<leader>o-", vim.cmd.Ex)
vim.keymap.set("n", "<leader>bk", vim.cmd.bd)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>P", "\"+P")


-- To get out from terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', {desc = 'Exit terminal mode'})

-- To open up Ipython in a new window
vim.keymap.set('n', '<leader>cp', ':vsplit term://python<cr> <C-W>L', {desc = '[c]ode repl [p]ython'})
