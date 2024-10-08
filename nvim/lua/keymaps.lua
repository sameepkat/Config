vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true, silent=true})
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Keybindings for telescope
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {noremap = true, silent = true})


-- Hop.nvim 
vim.keymap.set('', 's', function()
	require("hop").hint_char1({direction = nil})
end, {noremap = true, silent = true})
vim.keymap.set('', 'S', function()
	require("hop").hint_words()
end, {noremap = true, silent = true})
