local config = {}

function config.whichkey()
  local wk = require('which-key')
  wk.setup({
    plugins = {
      spelling = true,
    },
    icons = {
      breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
      separator = '➜', -- symbol used between a key and it's label
      group = '+', -- symbol prepended to a group
    },
    popup_mappings = {
      scroll_down = '<c-n>', -- binding to scroll down inside the popup
      scroll_up = '<c-p>', -- binding to scroll up inside the popup
    },
    window = {
      border = 'shadow', -- none, single, double, shadow
      position = 'bottom', -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = 'left', -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by deafult for Telescope
    disable = {
      buftypes = {},
      filetypes = { 'TelescopePrompt' },
    },
  })
  wk.register({
    --some custom key mappings.
  }, { prefix = '<Space>' })
end

function config.legendary()
  require('legendary').setup({

    keymaps = {
      -- map keys to a command
      --{ '<leader>ff', ':Telescope find_files<CR>', description = 'Find files' },
      -- map keys to a function
      -- keymaps have opts.silent = true by default, but you can override it
      -- create keymaps with different implementations per-mode
      {
        '<C-CR>',
        '<ESC>$a',
        description = 'Insert at end of line',
        opts = { silent = true },
      },
      {
        '<leader>bb',
        '<cmd>Telescope buffers<CR>',
        description = 'Buffer list',
        opts = { noremap = true, silent = true },
      },
      {
        '<leader>bk',
        '<cmd>bdelete<CR>',
        description = 'Buffer delete ',
        opts = { noremap = true, silent = true },
      },
      {
        '<leader>cc',
        { n = '<cmd>CommentToggle<CR>', x = ":'<,'>CommentToggle<CR>" },
        description = 'Toggle comment',
      },
      {
        '<leader>e',
        '<cmd>NeoTreeFocusToggle<CR>',
        description = 'NeoTree',
        opts = { silent = true },
      },
      {
        '<leader>V',
        '<cmd>Whereami<CR>',
        description = 'Where am I',
        opts = { silent = false },
      },
      {
        itemgroup = 'LSP',
        description = 'LSP',
        keymaps = {
          {
            '<Leader>ll',
            '<cmd>LspZeroFormat<CR>',
            description = 'LSP Format',
            opts = { silent = true },
          },
          {
            '<Leader>ls',
            '<cmd>Lspsaga lsp_finder<CR>',
            description = 'LSP Finder',
            opts = { silent = true },
          },
          {
            '<Leader>lr',
            '<cmd>Lspsaga rename<CR>',
            description = 'LSP Rename',
            opts = { silent = true },
          },
          {
            '<Leader>lo',
            '<cmd>Lspsaga outline<CR>',
            description = 'LSP Outline',
            opts = { silent = true },
          },
          {
            '<Leader>lg',
            '<cmd>Lspsaga goto_definition<CR>',
            description = 'LSP Goto Definition',
            opts = { silent = true },
          },
          {
            '<Leader>ld',
            '<cmd>Lspsaga peek_definition<CR>',
            description = 'LSP Preview Definition',
            opts = { silent = true },
          },
          {
            '<Leader>la',
            '<cmd>Lspsaga code_action<CR>',
            description = 'LSP Code Action',
            opts = { silent = true },
          },
          {
            '<Leader>lh',
            '<cmd>Lspsaga hover_doc<CR>',
            description = 'LSP Hover Doc',
            opts = { silent = true },
          },
          {
            '<Leader>lf',
            '<cmd>Lspsaga show_line_diagnostics<CR>',
            description = 'LSP Show Line Diagnostics',
            opts = { silent = true },
          },
          {
            '<Leader>lF',
            '<cmd>Lspsaga show_cursor_diagnostics<CR>',
            description = 'LSP Show Cursor Diagnostics',
            opts = { silent = true },
          },
          {
            '<C>-t',
            '<cmd>Lspsaga term_toggle<CR>',
            description = 'LSP Open Floaterm',
            opts = { silent = true },
          },
          -- {
          --   '<Leader>l<space>',
          --   '<cmd>Lspsaga signature_help<CR>',
          --   description = 'LSP Signature Help',
          --   opts = { silent = true },
          -- },
          {
            '<Leader>l[',
            '<cmd>Lspsaga diagnostic_jump_prev<CR>',
            description = 'LSP Diagnostic Jump Prev',
            opts = { silent = true },
          },
          {
            '<Leader>l]',
            '<cmd>Lspsaga diagnostic_jump_next<CR>',
            description = 'LSP Diagnostic Jump Next',
            opts = { silent = true },
          },
        },
      },
      {
        itemgroup = 'Debug',
        description = 'Debug',
        keymaps = {
          {
            '<Leader>dd',
            '<cmd>lua require("dapui").toggle()<CR>',
            description = 'DAP UI',
            opts = { silent = true },
          },
          {
            '<Leader>db',
            '<cmd>lua require("dap").toggle_breakpoint()<CR>',
            description = 'DAP Toggle Breakpoint',
            opts = { silent = true },
          },
          {
            '<Leader>dc',
            '<cmd>lua require("dap").continue()<CR>',
            description = 'DAP Continue',
            opts = { silent = true },
          },
          {
            '<Leader>di',
            '<cmd>lua require("dap").step_into()<CR>',
            description = 'DAP Step Into',
            opts = { silent = true },
          },
          {
            '<Leader>do',
            '<cmd>lua require("dap").step_out()<CR>',
            description = 'DAP Step Out',
            opts = { silent = true },
          },
          {
            '<Leader>dh',
            '<cmd>lua require("dapui").eval()<CR>',
            description = 'DAP Eval',
            opts = { silent = true },
          },
          {
            '<Leader>dv',
            '<cmd>lua require("dap.ui.variables").visual_hover()<CR>',
            description = 'DAP Visual Hover',
            opts = { silent = true },
          },
        },
      },
      {
        itemgroup = 'Trouble',
        description = 'Trouble',
        keymaps = {
          {
            '<leader>xx',
            '<cmd>TroubleToggle document_diagnostics<CR>',
            description = 'Toggle document diagnostics',
          },
          {
            '<leader>xw',
            '<cmd>TroubleToggle lsp_workspace_diagnostics<CR>',
            description = 'Toggle workspace diagnostics',
          },
          {
            '<leader>xl',
            '<cmd>TroubleToggle loclist<CR>',
            description = 'Toggle loclist',
          },
          {
            '<leader>xq',
            '<cmd>TroubleToggle quickfix<CR>',
            description = 'Toggle quickfix',
          },
          {
            '<leader>xt',
            '<cmd>TroubleToggle<CR>',
            description = 'Toggle trouble',
          },
          {
            '<leader>nd',
            '<cmd>NoiceDismiss<CR>',
            description = 'Dismiss all notifications',
          },
        },
        -- {'gR', '<cmd>TroubleToggle lsp_references<cr>', { silent = true, noremap = true }},
      },
      -- create item groups to create sub-menus in the finder
      -- -- note that only keymaps, commands, and functions
      -- -- can be added to item groups
      -- {
      --   -- groups with same itemgroup will be merged
      --   itemgroup = 'short ID',
      --   description = 'A submenu of items...',
      --   icon = '',
      --   keymaps = {
      --     -- more keymaps here
      -- { '<leader>s', ':SomeCommand<CR>', description = 'Non-silent keymap', opts = { silent = false } },
      --   },
      -- },
    },
    commands = {
      -- easily create user commands
      {
        ':Whereami',
        function()
          require('specs').show_specs({ width = 97, winhl = 'Search', delay_ms = 610, inc_ms = 21 })
        end,
        description = 'Where am I',
      },
      -- {
      --   -- groups with same itemgroup will be merged
      --   itemgroup = 'short ID',
      --   -- don't need to copy the other group data because
      --   -- it will be merged with the one from the keymaps table
      --   commands = {
      --     -- more commands here
      --   },
      -- },
    },
    funcs = {
      -- Make arbitrary Lua functions that can be executed via the item finder
      -- { function() doSomeStuff() end, description = 'Do some stuff with a Lua function!' },
      -- {
      --   -- groups with same itemgroup will be merged
      --   itemgroup = 'short ID',
      --   -- don't need to copy the other group data because
      --   -- it will be merged with the one from the keymaps table
      --   funcs = {
      --     -- more funcs here
      --   },
      -- },
    },
    autocmds = {

      -- Create autocmds and augroups
      -- { 'BufWritePre', vim.lsp.buf.format, description = 'Format on save' },
      -- {
      --   name = 'MyAugroup',
      --   clear = true,
      --   -- autocmds here
      -- },
    },
  })
end
return config
