vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true, silent=true})
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.api.nvim_set_keymap('n', '<leader>n', ':bnext<CR>', {noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>p', ':bprevious<CR>', {noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>bd', ':bdelete<CR>', {noremap = true, silent=true})



