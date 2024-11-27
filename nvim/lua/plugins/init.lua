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

			-- Use arrow keys for navigating completion
			vim.keymap.set('i', '<Down>', function()
				return vim.fn['coc#pum#visible']() == 1 and vim.fn['coc#pum#next'](1) or '<Down>'
			end, { expr = true })
			
			vim.keymap.set('i', '<Up>', function()
				return vim.fn['coc#pum#visible']() == 1 and vim.fn['coc#pum#prev'](1) or '<Up>'
			end, { expr = true })

			-- Use Enter to confirm completion
			vim.keymap.set('i', '<CR>', function()
				return vim.fn['coc#pum#visible']() == 1 and vim.fn['coc#pum#confirm']() or '<CR>'
			end, { expr = true })

			-- Use K to show documentation in preview window
			function _G.show_docs()
				local cw = vim.fn.expand('<cword>')
				if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
					vim.api.nvim_command('h ' .. cw)
				elseif vim.api.nvim_eval('coc#rpc#ready()') then
					vim.fn.CocActionAsync('doHover')
				else
					vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
				end
			end
			vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})
		end
	}
}
