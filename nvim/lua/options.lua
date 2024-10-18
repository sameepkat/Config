-- nvim/lua/options.lua
--
vim.g.mapleader = " "
vim.opt.clipboard = 'unnamedplus'
--- Set local options (equivalent to setl in Vimscript)
vim.opt.relativenumber = true

-- Setting buffer-specific variables
vim.b.vcm_tab_complete = 'javascript'  -- Equivalent to 'let b:vcm_tab_complete = "javascript"'
vim.b.javascript_fold = 1              -- Equivalent to 'let b:javascript_fold = 1'

-- Setting global variables
vim.g.javascript_plugin_jsdoc = 1      -- Equivalent to 'let g:javascript_plugin_jsdoc = 1'
vim.g.jsx_ext_required = 0             -- Equivalent to 'let g:jsx_ext_required = 0'
