local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "lewis6991/impatient.nvim" })
	use({ "goolord/alpha-nvim" })
	use("folke/which-key.nvim")
	use("simrat39/symbols-outline.nvim")
	use("j-hui/fidget.nvim")
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})
	use({ "ellisonleao/glow.nvim" })
	use("m-demare/hlargs.nvim")
	use({ "windwp/nvim-autopairs" })
	use("kylechui/nvim-surround")
	use("folke/trouble.nvim")
	use({
		"zbirenbaum/copilot-cmp",
		module = "copilot_cmp",
		requires = { "zbirenbaum/copilot.lua" },
	})

	-- Colorschemes
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})
	use("lunarvim/darkplus.nvim")
	use("sainnhe/edge")
	use({
		"olimorris/onedarkpro.nvim",
	})
	use({
		"meliora-theme/neovim",
		requires = { "rktjmp/lush.nvim" },
	})

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-cmdline" })

	-- snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer" }) -- simple to use language server installer
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
	})

	use("simrat39/rust-tools.nvim")
	use("Saecki/crates.nvim")
	use("vuki656/package-info.nvim")
	use("numToStr/Comment.nvim")
	use("phaazon/hop.nvim")
	use("max397574/better-escape.nvim")
	use("rcarriga/nvim-notify")
	use({ "stevearc/dressing.nvim" })
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
	use({
		"SmiteshP/nvim-navic",
	})
	use("yamatsum/nvim-cursorline")
	use("lewis6991/gitsigns.nvim")
	use({ "edluffy/specs.nvim" })
	use({ "michaelb/sniprun", run = "bash ./install.sh" })
	use({ "kevinhwang91/nvim-hlslens" })
	use({ "Abstract-IDE/penvim" })
	use("windwp/nvim-ts-autotag")
	use("p00f/nvim-ts-rainbow")
	use("monaqa/dial.nvim")
	use("Pocco81/HighStr.nvim")
	use("haringsrob/nvim_context_vt")
	use("ethanholz/nvim-lastplace")
	use("h-hg/fcitx.nvim")
	use({ "anuvyklack/pretty-fold.nvim" })
	use({ "mhartington/formatter.nvim" })
	use("famiu/bufdelete.nvim")
	use("AckslD/nvim-neoclip.lua")
	use("karb94/neoscroll.nvim")
	use("gelguy/wilder.nvim")
	use("RishabhRD/popfix")
	use("ray-x/lsp_signature.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("folke/todo-comments.nvim")
	use("akinsho/bufferline.nvim")
	use("nvim-lualine/lualine.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
