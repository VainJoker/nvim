local config = {}
function config.telescope()
  require('modules.tools.telescope')
end

function config.insx()
  require('insx.preset.standard').setup()
end

function config.comment()
  require('mini.comment').setup({
    options = {
      custom_commentstring = function()
        return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
      end,
    },
  })
end

function config.neogit()
  require('neogit').setup()
end

-- function config.dap()
--   require('modules.tools.dap')
-- end
-- function config.dapui()
--   require('dapui').setup({})
-- end
-- function config.dapvirtualtext()
--   require('nvim-dap-virtual-text').setup()
-- end
function config.lastplace()
  require('nvim-lastplace').setup({
    lastplace_ignore_buftype = { 'quickfix', 'nofile', 'help' },
    lastplace_ignore_filetype = { 'gitcommit', 'gitrebase', 'svn', 'hgcommit' },
    lastplace_open_folds = true,
  })
end

function config.imselect()
  require('im_select').setup({
    -- IM will be set to `default_im_select` in `normal` mode(`EnterVim` or `InsertLeave`)
    -- For Windows, default: "1003", aka: English US Keyboard
    -- You can use `im-select` in cli to get the IM name of you preferred
    default_im_select = 'com.apple.keylayout.ABC',

    -- Set to 1 if you don't want restore IM status when `InsertEnter`
    disable_auto_restore = 0,
  })
end

function config.neotree()
  vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
  vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
  vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
  vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

  require('neo-tree').setup({
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
  })
  vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
end

function config.guard()
  require('guard').setup({
    -- the only options for the setup function
    fmt_on_save = true,
    -- Use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = false,
  })
end

return config
