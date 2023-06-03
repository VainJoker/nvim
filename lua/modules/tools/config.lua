local config = {}
function config.telescope()
  Prequire('modules.tools.telescope')
end
function config.leap()
  Prequire('leap').add_default_mappings()
end
function config.comment()
  Prequire('nvim_comment').setup({
    create_mappings = false,
    hook = function()
      require('ts_context_commentstring.internal').update_commentstring()
    end,
  })
end
function config.neogit()
  Prequire('neogit').setup()
end
function config.dap()
  Prequire('modules.tools.dap')
end
function config.dapui()
  require('dapui').setup({})
end
function config.dapvirtualtext()
  require('nvim-dap-virtual-text').setup()
end
function config.cinnamon()
  Prequire('cinnamon').setup({
    extra_keymaps = true,
    override_keymaps = true,
    max_length = 500,
    scroll_limit = -1,
  })
end
function config.pantran()
  Prequire('pantran').setup({
    default_engine = 'deepl',
    engines = {
      yandex = {
        -- Default languages can be defined on a per engine basis. In this case
        -- `:lua Prequire("pantran.async").run(function()
        -- vim.pretty_print(Prequire("pantran.engines").yandex:languages()) end)`
        -- can be used to list available language identifiers.
        default_source = 'auto',
        default_target = 'cn',
      },
    },
  })
end
function config.lastplace()
  Prequire('nvim-lastplace').setup({
    lastplace_ignore_buftype = { 'quickfix', 'nofile', 'help' },
    lastplace_ignore_filetype = { 'gitcommit', 'gitrebase', 'svn', 'hgcommit' },
    lastplace_open_folds = true,
  })
end

function config.betterescape()
  Prequire('better_escape').setup({})
end

function config.windows()
  Prequire('windows').setup({
    autowidth = { --		       |windows.autowidth|
      enable = true,
      winwidth = 5, --		        |windows.winwidth|
      filetype = { --	      |windows.autowidth.filetype|
        help = 2,
      },
    },
    ignore = { --			  |windows.ignore|
      buftype = { 'quickfix' },
      filetype = { 'NvimTree', 'lspsagaoutline', 'dapui', 'neo-tree', 'undotree', 'gundo' },
    },
    animation = {
      enable = true,
      duration = 300,
      fps = 30,
      easing = 'in_out_sine',
    },
  })
end

function config.imselect()
  Prequire('im_select').setup({
    -- IM will be set to `default_im_select` in `normal` mode(`EnterVim` or `InsertLeave`)
    -- For Windows, default: "1003", aka: English US Keyboard
    -- You can use `im-select` in cli to get the IM name of you preferred
    default_im_select = 'com.apple.keylayout.ABC',

    -- Set to 1 if you don't want restore IM status when `InsertEnter`
    disable_auto_restore = 0,
  })
end

function config.neotree()
  Prequire('neo-tree').setup({
    close_if_last_window = true,
    enable_diagnostics = true,
    source_selector = {
      winbar = true,
      content_layout = 'center',
    },
    default_component_configs = {
      indent = { padding = 0 },
    },
    window = {
      width = 30,
    },
    filesystem = {
      follow_current_file = true,
      hijack_netrw_behavior = 'open_current',
      use_libuv_file_watcher = true,
      window = { mappings = { h = 'toggle_hidden' } },
    },
    event_handlers = {
      {
        event = 'neo_tree_buffer_enter',
        handler = function(_)
          vim.opt_local.signcolumn = 'auto'
        end,
      },
    },
  })
end

return config
