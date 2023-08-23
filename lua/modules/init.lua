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
    {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    'nvimdev/paradox.vim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd('colorscheme paradox')
    end,
  },
  { 'nvim-treesitter/nvim-treesitter', event = { "BufReadPost", "BufNewFile" }, build = ':TSUpdate', config = config.treesitter },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    config = config.noice,
    dependencies = {
      'MunifTanjim/nui.nvim',
      { 'rcarriga/nvim-notify', config = config.notify },
    },
  },
  { 'folke/which-key.nvim', event = 'VeryLazy', config = config.whichkey },
  { 'folke/trouble.nvim', cmd = 'TroubleToggle', config = true },
  { 'folke/persistence.nvim', event = 'BufReadPre', config = true },
  { 'folke/todo-comments.nvim', event = 'VeryLazy', config = config.todocomment },
  { 'folke/flash.nvim', event = 'VeryLazy', config = true },
  { 'folke/edgy.nvim', event = 'VeryLazy', config = true },
  { 'nvimdev/hlsearch.nvim', event = 'BufRead', config = true },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = config.dashborad,
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    cmd = 'Neotree',
    config = config.neotree,
  },
  { 'echasnovski/mini.pairs', lazy = false , config = true },
  --{ 'folke/neodev.nvim', lazy = false },
  --{ 'sindrets/diffview.nvim', event = 'VeryLazy',dependencies = 'nvim-lua/plenary.nvim' },
  --{ 'nvim-telescope/telescope.nvim', tag = '0.1.1', lazy = false, dependencies = { 'nvim-lua/plenary.nvim' } },
  --{ 'feline-nvim/feline.nvim', lazy = false, priority = 666, config = config.feline },
  --{ 'noib3/cokeline.nvim', lazy = false, priority = 666, config = config.cokeline },
  ---- { 'dstein64/vim-startuptime', cmd = 'StartupTime' },
  --{ 'kkharji/sqlite.lua', event = 'BufRead' },

  --{ 'xiyaowong/nvim-transparent', cmd = { 'TransparentToggle' } },
  ---- --    use({ 'goolord/alpha-nvim', opt = true, cmd = { 'Alpha' } })
  ---- --utils
  ---- { 'Wansmer/treesj', cmd = { 'TSJToggle', 'TSJSplit', 'TSJJoin' }, config = config.treesj },
  --{ 'windwp/nvim-ts-autotag', event = 'InsertEnter', config = true },
  --{ 'windwp/nvim-autopairs', event = 'InsertEnter', config = config.autopairs },
  --{ 'nvim-neo-tree/neo-tree.nvim', cmd = 'NeoTreeFocusToggle', config = config.neotree },
  ---- { 'edluffy/specs.nvim', event = 'VeryLazy', config = config.specs },
  --{ 'keaising/im-select.nvim', event = 'InsertEnter', config = config.imselect },
  ---- { 'yamatsum/nvim-cursorline', event = 'CursorMoved', config = true },
  ---- { 'sitiom/nvim-numbertoggle', event = 'VeryLazy' },
  --{ 'simrat39/rust-tools.nvim', ft = 'rust', config = config.rust },
  ----{ 'akinsho/flutter-tools.nvim', ft = 'dart', config = true},
  ---- { 'jackMort/ChatGPT.nvim', config = true, cmd = 'ChatGPT' },
  --{ 'ray-x/go.nvim', ft = 'go', config = config.go, dependencies = { 'ray-x/guihua.lua' } },
  ---- { 'sindrets/winshift.nvim', event = 'VeryLazy', config = true }, -- TODO
  --{ 'lewis6991/gitsigns.nvim', event = 'VeryLazy', config = true },
  --{ 'mrjones2014/nvim-ts-rainbow' , event = 'VeryLazy'},
  --{ 'NvChad/nvim-colorizer.lua', event = 'VeryLazy', config = true },
  --{ 'nvim-colortils/colortils.nvim', event = 'VeryLazy', config = true },
  ---- { 'HiPhish/nvim-ts-rainbow2', event = 'VeryLazy' },
  --{ 'ggandor/leap.nvim', event = 'VeryLazy', config = config.leap },
  --{ 'zbirenbaum/copilot.lua', event = 'InsertEnter', config = config.copilot },
  ---- { 'declancm/cinnamon.nvim', event = 'CursorMoved', config = config.cinnamon },
  --{ 'TimUntersberger/neogit', event = 'VeryLazy', config = true },
  ---- --  use({ 'kevinhwang91/promise-async', event = 'BufRead' })
  ---- --  use({ 'kevinhwang91/nvim-ufo', after = 'promise-async' }) -- TODO
  ---- --  use({ 'anuvyklack/fold-preview.nvim', opt = true }) -- TODO
  ---- {
  ----   'kevinhwang91/nvim-ufo',
  ----   event = 'BufRead',
  ----   dependencies = { 'kevinhwang91/promise-async' },
  ----   config = config.ufo,
  ---- },
  ---- {
  ----   'anuvyklack/windows.nvim',
  ----   event = 'VeryLazy',
  ----   dependencies = {
  ----     'anuvyklack/middleclass',
  ----     'anuvyklack/animation.nvim',
  ----   },
  ----   config = config.windows,
  ---- },
  --{
  --  'terrortylor/nvim-comment',
  --  event = 'VeryLazy',
  --  config = config.comment,
  --  dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring', event = 'VeryLazy' },
  --},
  --{ 'anuvyklack/keymap-amend.nvim', event = 'BufRead', config = config.keymapamend }, -- TODO
  --{ 'ethanholz/nvim-lastplace', event = 'BufRead', config = config.lastplace },
  --{ 'anuvyklack/hydra.nvim', event = 'VeryLazy', config = config.hydra }, -- TODO
  --{ 'mrjones2014/legendary.nvim', event = 'VeryLazy', config = config.legendary },
  --{
  --  'nvim-neorg/neorg',
  --  build = ':Neorg sync-parsers',
  --  ft = 'norg',
  --  cmd = 'Neorg',
  --  config = config.neorg,
  --},
  ----{
  ----  'mfussenegger/nvim-dap',
  ----  event = 'BufRead',
  ----  config = config.dap,
  ----  dependencies = {
  ----    { 'rcarriga/nvim-dap-ui', config = config.dapui },
  ----    { 'theHamsta/nvim-dap-virtual-text', config = config.dapvirtualtext },
  ----  },
  ----},
  {
    'VonHeikemen/lsp-zero.nvim',
    --lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    branch = 'v2.x',
    config = config.lspzero,
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'glepnir/lspsaga.nvim', config = config.lspsaga },
    },
  },
  {
    'hrsh7th/nvim-cmp',
    config = config.cmp,
    event = 'InsertEnter',
    dependencies = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline'},
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'tzachar/cmp-tabnine', build = './install.sh', config = config.tabnine },
      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },
  },
}
