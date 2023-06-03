local config = {}

function config.cokeline()
  Prequire('modules.ui.cokeline')
  local map = vim.api.nvim_set_keymap

  -- map('n', '<S-Tab>', '<Plug>(cokeline-focus-prev)', { silent = true })
  -- map('n', '<Tab>', '<Plug>(cokeline-focus-next)', { silent = true })
  map('n', '<Leader>bp', '<Plug>(cokeline-focus-prev)', { silent = true })
  map('n', '<Leader>bn', '<Plug>(cokeline-focus-next)', { silent = true })
  for i = 1, 9 do
    map('n', ('<Leader>b%s'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i), { silent = true })
  end
end
function config.feline()
  Prequire('modules.ui.feline')
end
function config.noice()
  require('modules.ui.noice')
end
--function config.colorscheme()
--  vim.cmd([[colorscheme tokyonight]])
--end
--function config.cursorline() -- TODO
--  Prequire('nvim-cursorline').setup()
--end
function config.barbecue()
  Prequire('barbecue').setup({
    include_buftypes = { '' },
  })
end
function config.notify()
  Prequire('notify').setup({
    background_colour = '#000000',
  })
end
--function config.nvimcontextvt()
--  Prequire('nvim_context_vt').setup({})
--end
function config.numbers()
  Prequire('numbers').setup({
    excluded_filetypes = {
      'Neotree',
      'neo-tree',
      'Lspsagaoutline',
      'Packer',
      'toggleterm',
      'TelescopePrompt',
    },
  })
end

function config.transparent()
  Prequire('transparent').setup({
    enable = false, -- boolean: enable transparent
    extra_groups = { -- table/string: additional groups that should be cleared
      'all',
    },
    exclude = {}, -- table: groups you don't want to clear
  })
end
function config.specs()
  Prequire('specs').setup({
    show_jumps = true,
    min_jump = 30,
    popup = {
      delay_ms = 0, -- delay before popup displays
      inc_ms = 10, -- time increments used for fade/resize effects
      blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
      width = 10,
      winhl = 'PMenu',
      fader = Prequire('specs').linear_fader,
      resizer = Prequire('specs').shrink_resizer,
    },
    ignore_filetypes = {},
    ignore_buftypes = {
      nofile = true,
    },
  })
end
function config.todocomment()
  Prequire('todo-comments').setup({
    highlight = {
      pattern = [[.*<(KEYWORDS)\s*]],
    },
  })
end

return config
