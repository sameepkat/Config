-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("plugins.plugins")
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
