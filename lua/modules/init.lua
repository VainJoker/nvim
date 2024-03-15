local config = {}

local vim = vim
local helper = require('core.helper')
local vim_path = helper.get_config_path()
local modules_dir = vim_path .. '/lua/modules'

local configs_file = {}
local tmp = vim.split(vim.fn.globpath(modules_dir, '*/config.lua'), '\n')
for _, f in ipairs(tmp) do
  configs_file[#configs_file + 1] = string.match(f, 'lua/(.+).lua$')
end

for _, f in ipairs(configs_file) do
  local config_temp = require(f)
  for k, v in pairs(config) do
    config[k] = v
  end
  for k, v in pairs(config_temp) do
    config[k] = v
  end
end

return {
  { 'dstein64/vim-startuptime', cmd = 'StartupTime' },
  --{ 'nvimdev/paradox.vim', lazy = false, config = config.colorscheme },
  { 'sainnhe/everforest', lazy = false, config = config.colorscheme },
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    config = config.treesitter,
  },
  { 'folke/which-key.nvim', event = 'VeryLazy', config = config.whichkey },
  { 'folke/trouble.nvim', cmd = 'TroubleToggle', config = true },
  { 'folke/persistence.nvim', event = 'BufReadPre', config = true },
  { 'folke/todo-comments.nvim', event = 'VeryLazy', config = config.todocomment },
  { 'folke/flash.nvim', event = 'VeryLazy', config = config.flash },
  { 'folke/edgy.nvim', event = 'VeryLazy', config = true },
  { 'nvimdev/hlsearch.nvim', event = 'BufRead', config = true },
  { 'nvimdev/dashboard-nvim', event = 'VimEnter', config = config.dashborad },
  { 'windwp/nvim-ts-autotag', event = 'InsertEnter', config = true },
  { 'windwp/nvim-autopairs', event = 'InsertEnter', config = config.autopairs },
  { 'karb94/neoscroll.nvim', event = 'VeryLazy', config = true },
  { 'keaising/im-select.nvim', event = 'InsertEnter', config = config.imselect },
  { 'lewis6991/gitsigns.nvim', event = 'VeryLazy', config = true },
  { 'nvim-telescope/telescope.nvim', cmd = 'Telescope', version = false, config = config.telescope },
  { 'freddiehaddad/feline.nvim', event = 'VeryLazy', config = config.feline },
  { 'willothy/nvim-cokeline', event = 'VeryLazy', config = config.cokeline },
  { 'akinsho/toggleterm.nvim', event = 'VeryLazy', version = '*', config = true },
  { 'nvimdev/guard.nvim', event = 'VeryLazy', dependencies = 'nvimdev/guard-collection', config = config.guard },
  { 'sindrets/diffview.nvim', event = 'VeryLazy', dependencies = 'nvim-lua/plenary.nvim' },
  { 'xiyaowong/nvim-transparent', cmd = { 'TransparentToggle' } },
  { 'ray-x/go.nvim', ft = 'go', config = config.go, dependencies = { 'ray-x/guihua.lua' } },
  { 'NvChad/nvim-colorizer.lua', event = 'VeryLazy', config = true },
  { 'nvim-colortils/colortils.nvim', event = 'VeryLazy', config = true },
  --{ 'zbirenbaum/copilot.lua', event = 'InsertEnter', build = ':Copilot auth', config = config.copilot },
  { 'echasnovski/mini.animate', version = false, event = 'VeryLazy', config = true },
  { 'echasnovski/mini.hipatterns', version = false, event = 'VeryLazy', config = true },
  { 'TimUntersberger/neogit', event = 'VeryLazy', config = true },
  { 'nkakouros-original/numbers.nvim', event = 'VeryLazy', config = config.numbers },
  { 'RRethy/vim-illuminate', event = 'VeryLazy', config = config.illuminate },
  {"jackMort/ChatGPT.nvim",event = "VeryLazy",config = true},
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    cmd = 'Neotree',
    config = config.neotree,
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    lazy = false,
    config = config.norg,
  },
  { 'mrcjkb/rustaceanvim', version = '^3', ft = 'rust', config = config.rust },
  { 'Saecki/crates.nvim', event = 'BufRead Cargo.toml', config = true },
  {
    'kevinhwang91/nvim-ufo',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'kevinhwang91/promise-async' },
      { 'anuvyklack/fold-preview.nvim', dependencies = 'anuvyklack/keymap-amend.nvim',config = config.foldpreview },
    },
    config = config.ufo,
  },
  { 'axkirillov/hbac.nvim', event = 'VeryLazy', config = true },
  { 'hrsh7th/nvim-insx', event = 'InsertEnter', branch = 'main', config = config.insx },
  { 'kylechui/nvim-surround', version = '*', event = 'VeryLazy', config = true },
  { 'mrjones2014/legendary.nvim', event = 'VeryLazy', config = config.legendary },
  { 'ethanholz/nvim-lastplace', event = { 'BufReadPre', 'BufNewFile' }, config = true },
  {
    'echasnovski/mini.comment',
    event = 'VeryLazy',
    config = config.comment,
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring', event = 'VeryLazy' },
  },
  { 'm-demare/hlargs.nvim', event = 'VeryLazy', config = true },
  { 'HiPhish/rainbow-delimiters.nvim', event = 'VeryLazy', config = config.rainbow },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = config.identline,
    dependencies = {
      'echasnovski/mini.indentscope',
      version = false,
      event = { 'BufReadPre', 'BufNewFile' },
      config = config.indentscope,
    },
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    config = config.noice,
    dependencies = {
      { 'MunifTanjim/nui.nvim' },
      { 'stevearc/dressing.nvim', event = 'VeryLazy', config = true },
      { 'rcarriga/nvim-notify', config = config.notify },
    },
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    branch = 'v3.x',
    config = config.lspzero,
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'glepnir/lspsaga.nvim', config = config.lspsaga },
    },
  },
  {
    'hrsh7th/nvim-cmp',
    version = false,
    config = config.cmp,
    event = 'InsertEnter',
    dependencies = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'tzachar/cmp-tabnine', build = './install.sh', config = config.tabnine },
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },
  },
}
