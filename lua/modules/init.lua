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
    'dstein64/vim-startuptime',
    -- lazy-load on a command
    cmd = 'StartupTime',
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
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    config = config.treesitter,
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    config = config.noice,
    dependencies = {
      'MunifTanjim/nui.nvim',
      { 'stevearc/dressing.nvim', event = 'VeryLazy', config = true },
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
  { 'windwp/nvim-ts-autotag', event = 'InsertEnter', config = true },
  { 'windwp/nvim-autopairs', event = 'InsertEnter', config = config.autopairs },
  { 'keaising/im-select.nvim', event = 'InsertEnter', config = config.imselect },
  { 'lewis6991/gitsigns.nvim', event = 'VeryLazy', config = true },
  { 'nvim-telescope/telescope.nvim', cmd = 'Telescope', version = false, config = config.telescope },
  { 'nvim-pack/nvim-spectre', event = 'VeryLazy', config = true },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = config.identline,
    dependencies = {
      {
        'echasnovski/mini.indentscope',
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = { 'BufReadPre', 'BufNewFile' },
        config = config.indentscope,
      },
    },
  },
  { 'freddiehaddad/feline.nvim', lazy = false, priority = 666, config = config.feline },
  { 'noib3/cokeline.nvim', lazy = false, priority = 666, config = config.cokeline },
  { 'sindrets/diffview.nvim', event = 'VeryLazy', dependencies = 'nvim-lua/plenary.nvim' },
  { 'xiyaowong/nvim-transparent', cmd = { 'TransparentToggle' } },
  { 'ray-x/go.nvim', ft = 'go', config = config.go, dependencies = { 'ray-x/guihua.lua' } },
  { 'NvChad/nvim-colorizer.lua', event = 'VeryLazy', config = true },
  { 'nvim-colortils/colortils.nvim', event = 'VeryLazy', config = true },
  -- TODO { 'hiphish/rainbow-delimiters.nvim',event = 'VeryLazy',config= config.rainbow},
  --{ 'zbirenbaum/copilot.lua', event = 'InsertEnter', config = config.copilot },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    'zbirenbaum/copilot-cmp',
    dependencies = 'copilot.lua',
    opts = {},
    config = function(_, opts)
      local copilot_cmp = require('copilot_cmp')
      copilot_cmp.setup(opts)
      -- attach cmp source whenever copilot attaches
      -- fixes lazy-loading issues with the copilot cmp source
      require('lazyvim.util').on_attach(function(client)
        if client.name == 'copilot' then
          copilot_cmp._on_insert_enter({})
        end
      end)
    end,
  },
  { 'echasnovski/mini.animate', version = false, event = 'VeryLazy', config = true },
  { 'echasnovski/mini.hipatterns', version = false, event = 'VeryLazy', config = true },
  { 'echasnovski/mini.starter', version = false, event = 'VeryLazy', config = true },
  ---- { 'declancm/cinnamon.nvim', event = 'CursorMoved', config = config.cinnamon },
  { 'TimUntersberger/neogit', event = 'VeryLazy', config = true },
  {
    'Saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    config = true,
  },
  {
    'simrat39/rust-tools.nvim',
    lazy = true,
    opts = function()
      local ok, mason_registry = pcall(require, 'mason-registry')
      local adapter ---@type any
      if ok then
        -- rust tools configuration for debugging support
        local codelldb = mason_registry.get_package('codelldb')
        local extension_path = codelldb:get_install_path() .. '/extension/'
        local codelldb_path = extension_path .. 'adapter/codelldb'
        local liblldb_path = vim.fn.has('mac') == 1 and extension_path .. 'lldb/lib/liblldb.dylib'
          or extension_path .. 'lldb/lib/liblldb.so'
        adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
      end
      return {
        dap = {
          adapter = adapter,
        },
        tools = {
          on_initialized = function()
            vim.cmd([[
                augroup RustLSP
                  autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                  autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                  autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
                augroup END
              ]])
          end,
        },
      }
    end,
    config = function() end,
  },
  { 'anuvyklack/fold-preview.nvim', config = true }, -- TODO
  {
    'kevinhwang91/nvim-ufo',
    event = 'BufRead',
    dependencies = { 'kevinhwang91/promise-async' },
    config = config.ufo,
  },
  { 'ethanholz/nvim-lastplace', event = 'BufRead', config = config.lastplace },
  { 'mrjones2014/legendary.nvim', event = 'VeryLazy', config = config.legendary },
  { 'echasnovski/mini.ai', event = 'VeryLazy', dependencies = { 'RRethy/nvim-treesitter-textobjects' }, config = true },
  {
    'echasnovski/mini.comment',
    event = 'VeryLazy',
    config = config.comment,
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring', event = 'VeryLazy' },
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    branch = 'v2.x',
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
      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },
  },
}
