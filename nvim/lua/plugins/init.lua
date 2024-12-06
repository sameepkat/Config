return {
	{ "folke/todo-comments.nvim", opts = {} },
	{ "williamboman/mason.nvim",
	config = function()
		require('mason').setup()
	end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"java",
					"javascript",
					"typescript",
					"python",
					"css",
					"json",
					"html",
					"dart",
				},
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
			})
		end
	},
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true, -- Enable treesitter
				ts_config = {
					lua = {'string'},
					javascript = {'template_string'},
				}
			})
		end
	},
	{
		'wakatime/vim-wakatime', lazy = false
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		end
	},
	{
		'neoclide/coc.nvim',
		branch = 'release',
		build = 'npm ci',
		config = function()
			-- Set highlight groups for coc.nvim
			vim.api.nvim_set_hl(0, 'CocFloating', { bg = '#1f2335' })
			vim.api.nvim_set_hl(0, 'CocMenuSel', { bg = '#2d3343' })
			
			-- Configure floating window border
			vim.g.coc_borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }
			
			-- Set pumblend for transparency
			vim.opt.pumblend = 10

			-- Use Tab to trigger completion
			function _G.check_back_space()
				local col = vim.fn.col('.') - 1
				return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
			end

			-- Use Tab for trigger completion and navigate snippet
			vim.keymap.set("i", "<TAB>", function()
				if vim.fn['coc#pum#visible']() == 1 then
					return vim.fn['coc#pum#next'](1)
				elseif vim.fn['coc#jumpable']() == 1 then
					return vim.fn['coc#rpc#request']('snippetNext', {})
				elseif _G.check_back_space() then
					return vim.fn['nvim_replace_termcodes']("<TAB>", true, true, true)
				else
					return vim.fn['coc#refresh']()
				end
			end, {silent = true, noremap = true, expr = true})

			-- Use Shift-Tab to navigate backwards in snippet
			vim.keymap.set("i", "<S-TAB>", function()
				if vim.fn['coc#jumpable']() == 1 then
					return vim.fn['coc#rpc#request']('snippetPrev', {})
				else
					return vim.fn['nvim_replace_termcodes']("<S-TAB>", true, true, true)
				end
			end, {silent = true, noremap = true, expr = true})

			-- Navigation in completion menu
			vim.keymap.set("i", "<C-j>", function()
				return vim.fn['coc#pum#visible']() == 1 and vim.fn['coc#pum#next'](1) or "<C-j>"
			end, {expr = true})
			
			vim.keymap.set("i", "<C-k>", function()
				return vim.fn['coc#pum#visible']() == 1 and vim.fn['coc#pum#prev'](1) or "<C-k>"
			end, {expr = true})

			-- Use <cr> or <C-l> to confirm completion
			vim.keymap.set("i", "<C-l>", function()
				return vim.fn['coc#pum#visible']() == 1 and vim.fn['coc#pum#confirm']() or "<C-l>"
			end, {expr = true})

			vim.keymap.set("i", "l", function()
				return vim.fn['coc#pum#visible']() == 1 and vim.fn['coc#pum#confirm']() or "l"
			end, {expr = true})

			vim.keymap.set('i', '<cr>', function()
				return vim.fn['coc#pum#visible']() == 1 and vim.fn['coc#pum#confirm']() or '<CR>'
			end, { expr = true })
		end
	},
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim',
		},
		config = function()
			require("flutter-tools").setup({
				ui = {
					border = "rounded",
					notification_style = 'native'
				},
				decorations = {
					statusline = {
						app_version = true,
						device = true,
					}
				},
				widget_guides = {
					enabled = true,
				},
				closing_tags = {
					highlight = "ErrorMsg",
					prefix = "//",
					enabled = true
				},
				lsp = {
					color = {
						enabled = true,
						background = true,
					},
					settings = {
						showTodos = true,
						completeFunctionCalls = true,
					}
				}
			})
		end
	},
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		config = function()
			require('rose-pine').setup({
				variant = 'moon',  -- moon, dawn, or main
				dark_variant = 'moon',
				disable_background = false,
				disable_float_background = false,
			})
			vim.cmd('colorscheme rose-pine')
		end
	},
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any custom configurations here
			toggler = {
				line = '<leader>cc', -- Line-comment toggle keymap
				block = '<leader>bc', -- Block-comment toggle keymap
			},
			opleader = {
				line = '<leader>c', -- Line-comment keymap
				block = '<leader>b', -- Block-comment keymap
			},
		},
		lazy = false,
	}
}
