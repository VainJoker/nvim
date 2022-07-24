local ok, neorg = pcall(require, "neorg")
if not ok then
	vim.notify("Could not load lastplace")
	return
end

neorg.setup({
	-- neorg_ignore_buftype = { "quickfix", "nofile", "help" },
	-- neorg_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
	-- neorg_open_folds = true,
	load = {
		["core.defaults"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					work = "~/Norg/work",
					home = "~/Norg/home",
					gtd = "~/Norg/gtd",
				},
			},
		},
		["core.norg.journal"] = {
			config = { -- Note that this table is optional and doesn't need to be provided
				-- Configuration here
			},
		},
		["core.norg.concealer"] = {},
		-- ["core.norg.completion"] = {
		-- engine = "nvim-cmp",
		-- },
		["core.integrations.nvim-cmp"] = {
			config = { -- Note that this table is optional and doesn't need to be provided
				-- Configuration here
			},
		},
		["core.gtd.base"] = {
			config = {
				workspace = "gtd",
			},
		},
		["core.export"] = {
			config = { -- Note that this table is optional and doesn't need to be provided
				export_dir = "~/Norg/export", -- Configuration here
			},
		},
	},
})
