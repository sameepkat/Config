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
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local lspconfig = require('lspconfig')
			require("mason-lspconfig").setup({
				ensure_installed = { "jdtls" }
			})
			
			-- Configure Java LSP
			lspconfig.jdtls.setup({
				capabilities = require('cmp_nvim_lsp').default_capabilities(),
				cmd = { 'jdtls' },
				root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
			})
		end
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local cmp = require('cmp')
			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-Space>'] = cmp.mapping.complete(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				}),
			})
		end
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true, -- Enable treesitter
				ts_config = {
					lua = {'string'},-- Don't add pairs in lua string treesitter nodes
					javascript = {'template_string'},-- Don't add pairs in javascript template_string
				}
			})
			
			-- If you want to automatically add `(` after selecting a function or method
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')
			local cmp = require('cmp')
			cmp.event:on(
				'confirm_done',
				cmp_autopairs.on_confirm_done()
			)
		end
	},
}
