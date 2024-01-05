local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
		{
				"folke/which-key.nvim",
				opts = {
						plugins = { spelling = true },
						defaults = {
								mode = { "n", "v" },
								["g"] = { name = "+goto" },
								["gs"] = { name = "+surround" },
								["]"] = { name = "+next" },
								["["] = { name = "+prev" },
								["<leader><tab>"] = { name = "+tabs" },
								["<leader>b"] = { name = "+buffer" },
								["<leader>c"] = { name = "+code" },
								["<leader>f"] = { name = "+file/find" },
								["<leader>g"] = { name = "+git" },
								["<leader>gh"] = { name = "+hunks" },
								["<leader>q"] = { name = "+quit/session" },
								["<leader>s"] = { name = "+search" },
								["<leader>u"] = { name = "+ui" },
								["<leader>w"] = { name = "+windows" },
								["<leader>x"] = { name = "+diagnostics/quickfix" },
						},
				}
		},
		{
				'nvim-telescope/telescope.nvim', tag = '0.1.5',
				dependencies = {'nvim-lua/plenary.nvim'} 
		},
		{
				'rose-pine/neovim',
				name = 'rose-pine',
		},
		'folke/tokyonight.nvim',
		{
				'nvim-treesitter/nvim-treesitter',
				build = ':TSUpdate',
		},
		('nvim-treesitter/playground'),
		'nvim-lua/plenary.nvim',
		'folke/todo-comments.nvim',
		'mbbill/undotree',
		'tpope/vim-fugitive',
		'github/copilot.vim',
		{
				"ThePrimeagen/harpoon",
				branch = "harpoon2",
				dependencies = {"nvim-lua/plenary.nvim"} 
		},
		'neovim/nvim-lspconfig',
		'hrsh7th/nvim-cmp',
		'L3MON4D3/LuaSnip',
		'hrsh7th/cmp-nvim-lsp',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		{
				'VonHeikemen/lsp-zero.nvim',
				branch = 'v3.x'
		},
		'echasnovski/mini.pairs',
		'echasnovski/mini.surround',
		'echasnovski/mini.comment',
		'JoosepAlviste/nvim-ts-context-commentstring',
		{
				'nvim-neo-tree/neo-tree.nvim', 
				dependencies = {
						"nvim-lua/plenary.nvim",
						"nvim-tree/nvim-web-devicons", 
						"MunifTanjim/nui.nvim",
				},
				opts = {
						sources = { "filesystem", "buffers", "git_status", "document_symbols" },
						open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
						filesystem = {
								bind_to_cwd = false,
								follow_current_file = { enabled = true },
								use_libuv_file_watcher = true,
						},
						window = {
								mappings = {
										["<space>"] = "none",
								},
						},
						default_component_configs = {
								indent = {
										with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
										expander_collapsed = "",
										expander_expanded = "",
										expander_highlight = "NeoTreeExpander",
								},
						},
				}
		},
		'nvim-pack/nvim-spectre'
}

require("lazy").setup(plugins, opts)
