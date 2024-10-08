require('nvim-treesitter.configs').setup{
	ensure_installed = {'vim','vimdoc','lua','cpp', 'javascript', 'typescript', 'c', 'tsx', 'html','css'},

	auto_install = false,

	highlight = {enable = true},

	indent = {enable = true},
}
