local config = {}
local vim = vim

function config.colorscheme()
  vim.cmd('colorscheme tokyonight-storm')
end

function config.tabby() end

function config.cokeline()
  prequire('modules.ui.cokeline')
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
  prequire('modules.ui.feline')
end

function config.noice()
  require('modules.ui.noice')
end

function config.rainbow()
  -- This module contains a number of default definitions
  local rainbow_delimiters = require('rainbow-delimiters')

  vim.g.rainbow_delimiters = {
    strategy = {
      [''] = rainbow_delimiters.strategy['global'],
      vim = rainbow_delimiters.strategy['local'],
    },
    query = {
      [''] = 'rainbow-delimiters',
      lua = 'rainbow-blocks',
    },
    highlight = {
      'RainbowDelimiterRed',
      'RainbowDelimiterYellow',
      'RainbowDelimiterBlue',
      'RainbowDelimiterOrange',
      'RainbowDelimiterGreen',
      'RainbowDelimiterViolet',
      'RainbowDelimiterCyan',
    },
  }
end

function config.indentline()
  require('indent_blankline').setup({
    char = '│',
    filetype_exclude = {
      'help',
      'alpha',
      'dashboard',
      'neo-tree',
      'Trouble',
      'lazy',
      'mason',
      'notify',
      'toggleterm',
      'lazyterm',
    },
    show_trailing_blankline_indent = false,
    show_current_context = false,
  })
end

function config.indentscope()
  require('mini.indentscope').setup({
    symbol = '│',
    options = { try_as_border = true },
  })
end

function config.notify()
  prequire('notify').setup({
    background_colour = '#000000',
  })
end

function config.numbers()
  prequire('numbers').setup({
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

function config.illuminate()
  -- default configuration
  require('illuminate').configure({
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
      'lsp',
      'treesitter',
      'regex',
    },
    -- delay: delay in milliseconds
    delay = 100,
    -- filetype_overrides: filetype specific overrides.
    -- The keys are strings to represent the filetype while the values are tables that
    -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
    filetype_overrides = {},
    -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
    filetypes_denylist = {
      'dirvish',
      'fugitive',
    },
    -- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
    filetypes_allowlist = {},
    -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
    -- See `:help mode()` for possible values
    modes_denylist = {},
    -- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
    -- See `:help mode()` for possible values
    modes_allowlist = {},
    -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_denylist = {},
    -- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_allowlist = {},
    -- under_cursor: whether or not to illuminate under the cursor
    under_cursor = true,
    -- large_file_cutoff: number of lines at which to use large_file_config
    -- The `under_cursor` option is disabled when this cutoff is hit
    large_file_cutoff = nil,
    -- large_file_config: config to use for large files (based on large_file_cutoff).
    -- Supports the same keys passed to .configure
    -- If nil, vim-illuminate will be disabled for large files.
    large_file_overrides = nil,
    -- min_count_to_highlight: minimum number of matches required to perform highlighting
    min_count_to_highlight = 1,
  })
end

function config.todocomment()
  prequire('todo-comments').setup({
    highlight = {
      pattern = [[.*<(KEYWORDS)\s*]],
    },
  })
end

-- function config.transparent()
--   prequire('transparent').setup({
--     enable = false, -- boolean: enable transparent
--     extra_groups = { -- table/string: additional groups that should be cleared
--       'all',
--     },
--     exclude = {}, -- table: groups you don't want to clear
--   })
-- end

return config
