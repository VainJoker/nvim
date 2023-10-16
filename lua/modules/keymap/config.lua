local config = {}

function config.legendary()
  require('legendary').setup({

    keymaps = {
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
        '<leader>E',
        '<cmd>Neotree<CR>',
        description = 'Neotree',
        opts = { silent = true },
      },
      {
        '<leader>Q',
        '<cmd>quit<CR>',
        description = 'Quit',
        opts = { silent = false },
      },
      {
        '<leader>G',
        '<cmd>Neogit<CR>',
        description = 'Neogit',
        opts = { silent = true },
      },
      {
        itemgroup = 'Telescope',
        description = 'Telescope',
        keymaps = {
          {
            '<Leader>ff',
            '<cmd>Telescope find_files<CR>',
            description = 'Find Files',
            opts = { silent = true },
          },
          {
            '<Leader>fF',
            '<cmd>Telescope find_files cwd=~<CR>',
            description = 'Find Files (cwd)',
            opts = { silent = true },
          },
          {
            '<Leader>fR',
            '<cmd>Telescope oldfiles<CR>',
            description = 'Recent Files',
            opts = { silent = true },
          },
          {
            '<Leader>f/',
            '<cmd>Telescope live_grep<CR>',
            description = 'Grep (root dir)',
            opts = { silent = true },
          },
          {
            '<Leader>f:',
            '<cmd>Telescope command_history<CR>',
            description = 'Command History',
            opts = { silent = true },
          },
          {
            '<Leader>fb',
            '<cmd>Telescope buffers show_all_buffers=true<CR>',
            description = 'Switch Buffer',
            opts = { silent = true },
          },
          {
            '<Leader>fgc',
            '<cmd>Telescope git_commits<CR>',
            description = 'Git Commits',
            opts = { silent = true },
          },
          {
            '<Leader>fgs',
            '<cmd>Telescope git_status<CR>',
            description = 'Git Status',
            opts = { silent = true },
          },
          {
            '<Leader>fr',
            '<cmd>Telescope registers<CR>',
            description = 'Registers',
            opts = { silent = true },
          },
          {
            '<Leader>fsa',
            '<cmd>Telescope autocommands<CR>',
            description = 'Auto Commands',
            opts = { silent = true },
          },
          {
            '<Leader>fsb',
            '<cmd>Telescope current_buffer_fuzzy_find<CR>',
            description = 'Buffer',
            opts = { silent = true },
          },
          {
            '<Leader>fsc',
            '<cmd>Telescope command_history<CR>',
            description = 'Command History',
            opts = { silent = true },
          },
          {
            '<Leader>fsC',
            '<cmd>Telescope commands<CR>',
            description = 'Commands',
            opts = { silent = true },
          },
          {
            '<Leader>fsd',
            '<cmd>Telescope diagnostics bufnr=0<CR>',
            description = 'Document diagnostics',
            opts = { silent = true },
          },
          {
            '<Leader>fsD',
            '<cmd>Telescope diagnostics<CR>',
            description = 'Workspace diagnostics',
            opts = { silent = true },
          },
          {
            '<Leader>fsh',
            '<cmd>Telescope help_tags<CR>',
            description = 'Help Pages',
            opts = { silent = true },
          },
          {
            '<Leader>fsH',
            '<cmd>Telescope highlights<CR>',
            description = 'Search Highlight Groups',
            opts = { silent = true },
          },
          {
            '<Leader>fsk',
            '<cmd>Telescope keymaps<CR>',
            description = 'Key Maps',
            opts = { silent = true },
          },
          {
            '<Leader>fsM',
            '<cmd>Telescope man_pages',
            description = 'Man Pages',
            opts = { silent = true },
          },
          {
            '<Leader>fso',
            '<cmd>Telescope vim_options<CR>',
            description = 'Options',
            opts = { silent = true },
          },
          {
            '<Leader>fC',
            '<cmd>Telescope colorscheme<CR>',
            description = 'Colorscheme',
            opts = { silent = true },
          }
        },
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
        itemgroup = 'Persistence',
        description = 'Persistence',
        keymaps = {
          {
            '<Leader>qs',
            [[<cmd>lua require("persistence").load()<cr>]],
            description = 'Restore the session for the current directory',
          },
          {
            '<Leader>ql',
            [[<cmd>lua require("persistence").load({ last = true })<cr>]],
            description = 'Restore the last session',
          },
          {
            '<Leader>qd',
            [[<cmd>lua require("persistence").stop()<cr>]],
          }
        }
      },
      {
        itemgroup = 'Flash',
        description = 'Flash',
        keymaps = {
          {
            's',
            '<cmd>lua require("flash").jump()<CR>',
            description = 'Flash',
            opts = { silent = true },
          },
          {
            'S',
            '<cmd>lua require("flash").treesitter()<CR>',
            description = 'Flash Treesitter',
            opts = { silent = true },
          },
          {
            'r',
            '<cmd>lua require("flash").remote()<CR>',
            description = 'Remote Flash',
            opts = { silent = true },
          },
          {
            'R',
            '<cmd>lua require("flash").treesitter_search()<CR>',
            description = 'Treesitter Search',
            opts = { silent = true },
          },
          {
            '<C-s>',
            '<cmd>lua require("flash").toggle()<CR>',
            description = 'Toggle Flash Search',
            opts = { silent = true },
          },
        }
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
      {
        itemgroup = 'Fold',
        description = 'Fold',
        keymaps = {
          {
            'zR',
            '<cmd>lua require("ufo").openAllFolds()<CR>',
            description = 'openAllFolds',
          },
          {
            'zM',
            '<cmd>lua require("ufo").closeAllFolds()<CR>',
            description = 'closeAllFolds',
          },
        },
        -- {'gR', '<cmd>TroubleToggle lsp_references<cr>', { silent = true, noremap = true }},
      },
      {
        itemgroup = 'Todo',
        description = 'Todo',
        keymaps = {
          {
            '<leader>tn',
            '<cmd>TodoTelescope<CR>',
            description = 'Next todo comment',
          },
          {
            '<leader>tp',
            '<cmd>TodoTelescope prev<CR>',
            description = 'Previous todo comment',
          },
          {
            '<leader>tx',
            '<cmd>TodoTrouble<CR>',
            description = 'Todo (Trouble)',
          },
          {
            '<leader>tX',
            '<cmd>TodoTrouble keywords=TODO,FIX,FIXME<CR>',
            description = 'Todo/Fix/Fixme (Trouble)',
          },
          {
            '<leader>tf',
            '<cmd>TodoTelescope<CR>',
            description = 'Todo',
          },
          {
            '<leader>tF',
            '<cmd>TodoTelescope keywords=TODO,FIX,FIXME<CR>',
            description = 'Todo/Fix/Fixme',
          },
        },
      },
      {
        itemgroup = 'Noice',
        description = 'Noice',
        keymaps = {
          {
            '<leader>snl',
            '<cmd>NoiceLast<CR>',
            description = 'Noice Last Message',
          },
          {
            '<leader>snh',
            '<cmd>NoiceHistory<CR>',
            description = 'Noice History',
          },
          {
            '<leader>sna',
            '<cmd>NoiceAll<CR>',
            description = 'Noice All',
          },
          {
            '<leader>snd',
            '<cmd>NoiceDismiss<CR>',
            description = 'Dismiss All',
          },
        },
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
