local status_ok, Hydra = pcall(require, "hydra")
if not status_ok then
	vim.notify("hydra not found!")
	return
end
local function cmd(command)
	return table.concat({ "<Cmd>", command, "<CR>" })
end

local gitsigns = require("gitsigns")

local git_hint = [[
 _J_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
 _K_: prev hunk   _u_: undo last stage   _p_: preview hunk   _B_: blame show full 
 ^ ^              _S_: stage buffer      ^ ^                 _/_: show base file
 ^
 ^ ^              _<Enter>_: Neogit              _<ESC>_: exit
]]
Hydra({
	name = "Git",
	hint = git_hint,
	config = {
		buffer = bufnr,
		color = "pink",
		invoke_on_body = true,
		hint = {
			border = "rounded",
		},
		on_enter = function()
			vim.cmd("mkview")
			vim.cmd("silent! %foldopen!")
			vim.bo.modifiable = false
			gitsigns.toggle_signs(true)
			gitsigns.toggle_linehl(true)
		end,
		on_exit = function()
			local cursor_pos = vim.api.nvim_win_get_cursor(0)
			vim.cmd("loadview")
			vim.api.nvim_win_set_cursor(0, cursor_pos)
			vim.cmd("normal zv")
			gitsigns.toggle_signs(false)
			gitsigns.toggle_linehl(false)
			gitsigns.toggle_deleted(false)
		end,
	},
	mode = { "n", "x" },
	body = "<leader>g",
	heads = {
		{
			"J",
			function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gitsigns.next_hunk()
				end)
				return "<Ignore>"
			end,
			{ expr = true, desc = "next hunk" },
		},
		{
			"K",
			function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gitsigns.prev_hunk()
				end)
				return "<Ignore>"
			end,
			{ expr = true, desc = "prev hunk" },
		},
		{ "s", ":Gitsigns stage_hunk<CR>", { silent = true, desc = "stage hunk" } },
		{ "u", gitsigns.undo_stage_hunk, { desc = "undo last stage" } },
		{ "S", gitsigns.stage_buffer, { desc = "stage buffer" } },
		{ "p", gitsigns.preview_hunk, { desc = "preview hunk" } },
		{ "d", gitsigns.toggle_deleted, { nowait = true, desc = "toggle deleted" } },
		{ "b", gitsigns.blame_line, { desc = "blame" } },
		{
			"B",
			function()
				gitsigns.blame_line({ full = true })
			end,
			{ desc = "blame show full" },
		},
		{ "/", gitsigns.show, { exit = true, desc = "show base file" } }, -- show the base of the file
		{ "<Enter>", "<Cmd>Neogit<CR>", { exit = true, desc = "Neogit" } },
		{ "<ESC>", nil, { exit = true, nowait = true, desc = "exit" } },
	},
})

local telescope_hint = [[
                 _f_: files       _r_: recently files
   🭇🬭🬭🬭🬭🬭🬭🬭🬭🬼    _g_: live grep   _/_: search in file
  🭉🭁🭠🭘    🭣🭕🭌🬾   _h_: vim help    _c_: execute command
  🭅█ ▁     █🭐
  ██🬿      🭊██   
 🭋█🬝🮄🮄🮄🮄🮄🮄🮄🮄🬆█🭀  _C_: clipboard   _t_: search todo
 🭤🭒🬺🬹🬱🬭🬭🬭🬭🬵🬹🬹🭝🭙  _k_: keymaps     _;_: commands history 
                 _O_: options     _?_: search history
 ^
                 _<Enter>_: Telescope           _<Esc>_
]]

Hydra({
	name = "Telescope",
	hint = telescope_hint,
	config = {
		color = "teal",
		invoke_on_body = true,
		hint = {
			position = "middle",
			border = "rounded",
		},
	},
	mode = "n",
	body = "<Leader>f",
	heads = {
		{ "f", cmd("Telescope find_files") },
		{ "g", cmd("Telescope live_grep theme=ivy") },
		{ "r", cmd("Telescope oldfiles"), { desc = "recently opened files" } },
		{ "h", cmd("Telescope help_tags"), { desc = "vim help" } },
		{ "C", cmd("Telescope Clipboard") },
		-- { 'm', cmd 'MarksListBuf', { desc = 'marks' } },
		{ "k", cmd("Telescope keymaps") },
		{ "O", cmd("Telescope vim_options") },
		{ "t", cmd("TodoTelescope") },
		-- { 'r', cmd 'Telescope resume' },
		-- { 'p', cmd 'Telescope projects', { desc = 'projects' } },
		{ "/", cmd("Telescope current_buffer_fuzzy_find"), { desc = "search in file" } },
		{ "?", cmd("Telescope search_history"), { desc = "search history" } },
		{ ";", cmd("Telescope command_history"), { desc = "command-line history" } },
		{ "c", cmd("Telescope commands"), { desc = "execute command" } },
		-- { 'u', cmd 'silent! %foldopen! | UndotreeToggle', { desc = 'undotree' }},
		{ "<Enter>", cmd("Telescope"), { exit = true, desc = "list all pickers" } },
		{ "<Esc>", nil, { exit = true, nowait = true } },
	},
})

		-- { "f", cmd("Telescope find_files") },
		-- { "a", cmd("Neorg gtd views<cr>") },
		-- { "c", cmd("Neorg gtd capture<cr>") },
		-- { "o", cmd("Neorg export<cr>") },
		-- { "j", cmd("Neorg journal<cr>") },
local neorg_hint = [[
 _a_: Org Agenda        _c_: Org Capture       _j_ Org journal
 _e_: Org Export
 ^ ^                    _<Enter>_: Neogit      _<ESC>_: exit
]]

Hydra({
	name = "Neorg",
	hint = neorg_hint,
	config = {
		color = "teal",
		invoke_on_body = true,
		hint = {
			position = "middle",
			border = "rounded",
		},
	},
	mode = "n",
	body = "<Leader>o",
	heads = {
		{ "a", cmd("Neorg gtd views<cr>") },
		{ "c", cmd("Neorg gtd capture<cr>") },
		{ "e", cmd("Neorg export<cr>") },
		{ "j", cmd("Neorg journal<cr>") },
		{ "<Enter>", cmd("Neorg"), { exit = true, desc = "list all pickers" } },
		{ "<ESC>", nil, { exit = true, nowait = true } },
	},
})
