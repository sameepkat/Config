return{
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require("lualine").setup({
				icons_enable = true,
			})
		end,
},
{
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

	'folke/neodev.nvim',
},
{
	'hrsh7th/nvim-cmp',
	dependencies = {
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
		'rafamadriz/friendly-snippets',
		'hrsh7th/cmp-nvim-lsp',
	},
	sources = {
			{name = 'buffer'},
		},
},
{
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
},
{
	'nvim-telescope/telescope-fzf-native.nvim',
	build = 'make',
	dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
},
	{
		"rose-pine/neovim", name = "rose-pine"
	},
	{
		"phaazon/hop.nvim",
		config = function ()
			require('hop').setup()
		end,
	},
	{
        "MunifTanjim/prettier.nvim",
        config = function()
            require('prettier').setup({
                bin = 'prettierd', -- or `'prettier'` for direct usage
                filetypes = {
                    "javascript", "typescript", "css", "html", "json",
                    "yaml", "markdown", "graphql", "javascriptreact",
                    "typescriptreact"
                }
            })
        end
    },
	{
		'maxmellon/vim-jsx-pretty',
    ft = { 'javascript.jsx', 'typescript.tsx' }
  },
  {
		"othree/javascript-libraries-syntax.vim",
    ft = 'javascript'
  },
  {
    'pangloss/vim-javascript',
    ft = 'javascript'
  },
}
