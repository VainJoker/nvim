-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function("has", { "nvim-0.5" }) ~= 1 then
	vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
	return
end

vim.api.nvim_command("packadd packer.nvim")

local no_errors, error_msg = pcall(function()
	local time
	local profile_info
	local should_profile = false
	if should_profile then
		local hrtime = vim.loop.hrtime
		profile_info = {}
		time = function(chunk, start)
			if start then
				profile_info[chunk] = hrtime()
			else
				profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
			end
		end
	else
		time = function(chunk, start) end
	end

	local function save_profiles(threshold)
		local sorted_times = {}
		for chunk_name, time_taken in pairs(profile_info) do
			sorted_times[#sorted_times + 1] = { chunk_name, time_taken }
		end
		table.sort(sorted_times, function(a, b)
			return a[2] > b[2]
		end)
		local results = {}
		for i, elem in ipairs(sorted_times) do
			if not threshold or threshold and elem[2] > threshold then
				results[i] = elem[1] .. " took " .. elem[2] .. "ms"
			end
		end

		_G._packer = _G._packer or {}
		_G._packer.profile_output = results
	end

	time([[Luarocks path setup]], true)
	local package_path_str =
		"/home/vainjoker/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/vainjoker/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/vainjoker/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/vainjoker/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
	local install_cpath_pattern = "/home/vainjoker/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
	if not string.find(package.path, package_path_str, 1, true) then
		package.path = package.path .. ";" .. package_path_str
	end

	if not string.find(package.cpath, install_cpath_pattern, 1, true) then
		package.cpath = package.cpath .. ";" .. install_cpath_pattern
	end

	time([[Luarocks path setup]], false)
	time([[try_loadstring definition]], true)
	local function try_loadstring(s, component, name)
		local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
		if not success then
			vim.schedule(function()
				vim.api.nvim_notify(
					"packer.nvim: Error running " .. component .. " for " .. name .. ": " .. result,
					vim.log.levels.ERROR,
					{}
				)
			end)
		end
		return result
	end

	time([[try_loadstring definition]], false)
	time([[Defining packer_plugins]], true)
	_G.packer_plugins = {
		["Comment.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/Comment.nvim",
			url = "https://github.com/numToStr/Comment.nvim",
		},
		["HighStr.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/HighStr.nvim",
			url = "https://github.com/Pocco81/HighStr.nvim",
		},
		LuaSnip = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/LuaSnip",
			url = "https://github.com/L3MON4D3/LuaSnip",
		},
		["alpha-nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/alpha-nvim",
			url = "https://github.com/goolord/alpha-nvim",
		},
		["better-escape.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/better-escape.nvim",
			url = "https://github.com/max397574/better-escape.nvim",
		},
		["bufdelete.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/bufdelete.nvim",
			url = "https://github.com/famiu/bufdelete.nvim",
		},
		["bufferline.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
			url = "https://github.com/akinsho/bufferline.nvim",
		},
		["cmp-buffer"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/cmp-buffer",
			url = "https://github.com/hrsh7th/cmp-buffer",
		},
		["cmp-cmdline"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
			url = "https://github.com/hrsh7th/cmp-cmdline",
		},
		["cmp-nvim-lsp"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
			url = "https://github.com/hrsh7th/cmp-nvim-lsp",
		},
		["cmp-nvim-lua"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
			url = "https://github.com/hrsh7th/cmp-nvim-lua",
		},
		["cmp-path"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/cmp-path",
			url = "https://github.com/hrsh7th/cmp-path",
		},
		cmp_luasnip = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
			url = "https://github.com/saadparwaiz1/cmp_luasnip",
		},
		["copilot-cmp"] = {
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/opt/copilot-cmp",
			url = "https://github.com/zbirenbaum/copilot-cmp",
		},
		["copilot.lua"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/copilot.lua",
			url = "https://github.com/zbirenbaum/copilot.lua",
		},
		["crates.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/crates.nvim",
			url = "https://github.com/Saecki/crates.nvim",
		},
		["dial.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/dial.nvim",
			url = "https://github.com/monaqa/dial.nvim",
		},
		["dressing.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/dressing.nvim",
			url = "https://github.com/stevearc/dressing.nvim",
		},
		["fcitx.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/fcitx.nvim",
			url = "https://github.com/h-hg/fcitx.nvim",
		},
		["fidget.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/fidget.nvim",
			url = "https://github.com/j-hui/fidget.nvim",
		},
		["friendly-snippets"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/friendly-snippets",
			url = "https://github.com/rafamadriz/friendly-snippets",
		},
		["gitsigns.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
			url = "https://github.com/lewis6991/gitsigns.nvim",
		},
		["glow.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/glow.nvim",
			url = "https://github.com/ellisonleao/glow.nvim",
		},
		["hlargs.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/hlargs.nvim",
			url = "https://github.com/m-demare/hlargs.nvim",
		},
		["hop.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/hop.nvim",
			url = "https://github.com/phaazon/hop.nvim",
		},
		["hydra.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/hydra.nvim",
			url = "https://github.com/anuvyklack/hydra.nvim",
		},
		["impatient.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/impatient.nvim",
			url = "https://github.com/lewis6991/impatient.nvim",
		},
		["indent-blankline.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
			url = "https://github.com/lukas-reineke/indent-blankline.nvim",
		},
		["lsp_signature.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
			url = "https://github.com/ray-x/lsp_signature.nvim",
		},
		["lualine.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/lualine.nvim",
			url = "https://github.com/nvim-lualine/lualine.nvim",
		},
		neorg = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/neorg",
			url = "https://github.com/nvim-neorg/neorg",
		},
		["neoscroll.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
			url = "https://github.com/karb94/neoscroll.nvim",
		},
		["null-ls.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
			url = "https://github.com/jose-elias-alvarez/null-ls.nvim",
		},
		nvim = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/nvim",
			url = "https://github.com/catppuccin/nvim",
		},
		["nvim-autopairs"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
			url = "https://github.com/windwp/nvim-autopairs",
		},
		["nvim-cmp"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/nvim-cmp",
			url = "https://github.com/hrsh7th/nvim-cmp",
		},
		["nvim-code-action-menu"] = {
			commands = { "CodeActionMenu" },
			loaded = false,
			needs_bufread = true,
			only_cond = false,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu",
			url = "https://github.com/weilbith/nvim-code-action-menu",
		},
		["nvim-cursorline"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/nvim-cursorline",
			url = "https://github.com/yamatsum/nvim-cursorline",
		},
		["nvim-hlslens"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/nvim-hlslens",
			url = "https://github.com/kevinhwang91/nvim-hlslens",
		},
		["nvim-lastplace"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/nvim-lastplace",
			url = "https://github.com/ethanholz/nvim-lastplace",
		},
		["nvim-lsp-installer"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
			url = "https://github.com/williamboman/nvim-lsp-installer",
		},
		["nvim-lspconfig"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
			url = "https://github.com/neovim/nvim-lspconfig",
		},
		["nvim-navic"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/nvim-navic",
			url = "https://github.com/SmiteshP/nvim-navic",
		},
		["nvim-neoclip.lua"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
			url = "https://github.com/AckslD/nvim-neoclip.lua",
		},
		["nvim-notify"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/nvim-notify",
			url = "https://github.com/rcarriga/nvim-notify",
		},
		["nvim-surround"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/nvim-surround",
			url = "https://github.com/kylechui/nvim-surround",
		},
		["nvim-tree.lua"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
			url = "https://github.com/kyazdani42/nvim-tree.lua",
		},
		["nvim-treesitter"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
			url = "https://github.com/nvim-treesitter/nvim-treesitter",
		},
		["nvim-ts-autotag"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
			url = "https://github.com/windwp/nvim-ts-autotag",
		},
		["nvim-ts-rainbow"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
			url = "https://github.com/p00f/nvim-ts-rainbow",
		},
		["nvim-ufo"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/nvim-ufo",
			url = "https://github.com/kevinhwang91/nvim-ufo",
		},
		["nvim-web-devicons"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
			url = "https://github.com/kyazdani42/nvim-web-devicons",
		},
		["package-info.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/package-info.nvim",
			url = "https://github.com/vuki656/package-info.nvim",
		},
		["packer.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/packer.nvim",
			url = "https://github.com/wbthomason/packer.nvim",
		},
		["plenary.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/plenary.nvim",
			url = "https://github.com/nvim-lua/plenary.nvim",
		},
		popfix = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/popfix",
			url = "https://github.com/RishabhRD/popfix",
		},
		["pretty-fold.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/pretty-fold.nvim",
			url = "https://github.com/anuvyklack/pretty-fold.nvim",
		},
		["promise-async"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/promise-async",
			url = "https://github.com/kevinhwang91/promise-async",
		},
		["rust-tools.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
			url = "https://github.com/simrat39/rust-tools.nvim",
		},
		sniprun = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/sniprun",
			url = "https://github.com/michaelb/sniprun",
		},
		["specs.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/specs.nvim",
			url = "https://github.com/edluffy/specs.nvim",
		},
		["symbols-outline.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
			url = "https://github.com/simrat39/symbols-outline.nvim",
		},
		["telescope.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/telescope.nvim",
			url = "https://github.com/nvim-telescope/telescope.nvim",
		},
		["todo-comments.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
			url = "https://github.com/folke/todo-comments.nvim",
		},
		["trouble.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/trouble.nvim",
			url = "https://github.com/folke/trouble.nvim",
		},
		["which-key.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/which-key.nvim",
			url = "https://github.com/folke/which-key.nvim",
		},
		["wilder.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/wilder.nvim",
			url = "https://github.com/gelguy/wilder.nvim",
		},
		["zen-mode.nvim"] = {
			loaded = true,
			path = "/home/vainjoker/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
			url = "https://github.com/folke/zen-mode.nvim",
		},
	}

	time([[Defining packer_plugins]], false)
	local module_lazy_loads = {
		["^copilot_cmp"] = "copilot-cmp",
	}
	local lazy_load_called = { ["packer.load"] = true }
	local function lazy_load_module(module_name)
		local to_load = {}
		if lazy_load_called[module_name] then
			return nil
		end
		lazy_load_called[module_name] = true
		for module_pat, plugin_name in pairs(module_lazy_loads) do
			if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
				to_load[#to_load + 1] = plugin_name
			end
		end

		if #to_load > 0 then
			require("packer.load")(to_load, { module = module_name }, _G.packer_plugins)
			local loaded_mod = package.loaded[module_name]
			if loaded_mod then
				return function(modname)
					return loaded_mod
				end
			end
		end
	end

	if not vim.g.packer_custom_loader_enabled then
		table.insert(package.loaders, 1, lazy_load_module)
		vim.g.packer_custom_loader_enabled = true
	end

	-- Command lazy-loads
	time([[Defining lazy-load commands]], true)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	time([[Defining lazy-load commands]], false)

	if should_profile then
		save_profiles()
	end
end)

if not no_errors then
	error_msg = error_msg:gsub('"', '\\"')
	vim.api.nvim_command(
		'echohl ErrorMsg | echom "Error in packer_compiled: '
			.. error_msg
			.. '" | echom "Please check your config for correctness" | echohl None'
	)
end
