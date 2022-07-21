local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
--keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
--keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
--keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
--keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
--keymap("t", "<Leader>t", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', term_opts)
--keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
--keymap("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opts)
--keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opts)
--keymap("n", "<leader>dl", "lua require'dap'.run_last()<cr>", opts)
--keymap("n", "<F10>", '<cmd>lua require"user.dap.dap-util".reload_continue()<CR>', opts)
--keymap("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", opts)
--keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
--keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
--keymap("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
--keymap("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
--keymap("n", "K", "<cmd>lua require'dapui'.eval()<cr>", opts)
