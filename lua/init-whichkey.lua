local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end
-- wk.show = function(keys, opts)
-- 	if vim.bo.filetype == "TelescopePrompt" then
-- 		return
-- 	end
-- 	show(keys, opts)
-- end
local show = which_key.show
which_key.show = function(keys, opts)
	if vim.bo.filetype == "norg" and vim.bo.buftype == "nofile" then
		local map = "<c-r>"
		local key = vim.api.nvim_replace_termcodes(map, true, false, true)
		vim.api.nvim_feedkeys(key, "i", true)
	end
	show(keys, opts)
end
local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Quit" },
	["m"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	-- ["T"] = { "<cmd>lua require('FTerm').toggle()<CR>", "Toggle Terminal" },
	["S"] = { "<cmd>SymbolsOutline<CR>", "SymbolsOutline" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	-- ["K"] = { "<cmd>Lspsaga hover_doc<cr>", "Hover Doc" },

	b = {
		name = "Buffer",
		b = {
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Buffers",
		},
		k = { "<cmd>Bdelete!<CR>", "Close Buffer" },
		["1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "Select Buffer 1" },
		["2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "Select Buffer 2" },
		["3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "Select Buffer 3" },
		["4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "Select Buffer 4" },
		["5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "Select Buffer 5" },
		["6"] = { "<cmd>BufferLineGoToBuffer 6<cr>", "Select Buffer 6" },
		["7"] = { "<cmd>BufferLineGoToBuffer 7<cr>", "Select Buffer 7" },
		["8"] = { "<cmd>BufferLineGoToBuffer 8<cr>", "Select Buffer 8" },
		["9"] = { "<cmd>BufferLineGoToBuffer 9<cr>", "Select Buffer 9" },
	},

	f = {
		name = "Find",
		f = {
			"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Find files",
		},
		d = { "<cmd>TodoTelescope<cr>", "Todos" },
		t = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
		p = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		c = { "lua require('telescope').extensions.neoclip.default()", "Clipboard" },
	},

	o = {
		name = "OrgMode",
		a = { "<cmd>Neorg gtd views<cr>", "Views" },
		c = { "<cmd>Neorg gtd capture<cr>", "Capture" },
		o = { "<cmd>Neorg export<cr>", "Export" },
		j = { "<cmd>Neorg journal<cr>", "Journal" },
		-- p = { "<cmd>Neorg <cr>", "Projects" },}
	},

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	g = {
		name = "Git",
		g = { "<cmd>lua __fterm_gitui()<CR>", "Gitui" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},

	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

	l = {
		name = "LSP",
		a = { "<cmd>CodeActionMenu<cr>", "Code Action" },
		w = {
			"<cmd>Telescope diagnostics<cr>",
			"Diagnostics",
		},
		d = {
			"<cmd>lua vim.lsp.buf.definition()<cr>",
			"GO TO Definition",
		},
		D = {
			"<cmd>lua vim.lsp.buf.declaration()<cr>",
			"GO TO Declaration",
		},
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {
			"<cmd>lua vim.diagnostic.goto_next()<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.diagnostic.goto_prev()<cr>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},

	H = {
		name = "Help",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
	},

	x = {
		name = "Trouble",
		x = { "<cmd>TroubleToggle<cr>", "ToggleTrouble" },
		d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
		w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
		q = { "<cmd>Trouble quickfix<cr>", "Quick Fix" },
		u = { "<cmd>Trouble lsp_references<cr>", "Usage" },
		l = { "<cmd>Trouble loclist<cr>", "Loclist" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
