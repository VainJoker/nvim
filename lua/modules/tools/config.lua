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

function config.ufo()
  local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (' 󰁂 %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
      local chunkText = chunk[1]
      local chunkWidth = vim.fn.strdisplaywidth(chunkText)
      if targetWidth > curWidth + chunkWidth then
        table.insert(newVirtText, chunk)
      else
        chunkText = truncate(chunkText, targetWidth - curWidth)
        local hlGroup = chunk[2]
        table.insert(newVirtText, { chunkText, hlGroup })
        chunkWidth = vim.fn.strdisplaywidth(chunkText)
        -- str width returned from truncate() may less than 2nd argument, need padding
        if curWidth + chunkWidth < targetWidth then
          suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
        end
        break
      end
      curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, { suffix, 'MoreMsg' })
    return newVirtText
  end
  require('ufo').setup({
    fold_virt_text_handler = handler,
  })
end

function config.foldpreview()
  local fp = require('fold-preview')
  local map = require('fold-preview').mapping
  local keymap = vim.keymap
  keymap.amend = require('keymap-amend')

  fp.setup({
    default_keybindings = false
    -- another settings
  })

  keymap.amend('n', 'K', function(original)
    if not fp.show_preview() then original() end
    -- or
    -- if not fp.toggle_preview() then original() end
    -- to close preview on second press on K.
  end)
  keymap.amend('n', 'h',  map.close_preview_open_fold)
  keymap.amend('n', 'l',  map.close_preview_open_fold)
  keymap.amend('n', 'zo', map.close_preview)
  keymap.amend('n', 'zO', map.close_preview)
  keymap.amend('n', 'zc', map.close_preview_without_defer)
  keymap.amend('n', 'zR', map.close_preview)
  keymap.amend('n', 'zM', map.close_preview_without_defer)
end

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


return config
