local config = {}

function config.cmp()
  require('modules.completion.cmp')
end

function config.copilot()
  require('copilot').setup({
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = '<C-l>',
        next = '[[',
        prev = ']]',
        dismiss = "<C-'>",
      },
    },
    filetypes = {
      markdown = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ['.'] = false,
    },
    copilot_node_command = 'node', -- Node version must be < 18
    server_opts_overrides = {},
  })
  vim.api.nvim_set_hl(0, 'CopilotSuggestion', { fg = '#83a598' })
  vim.api.nvim_set_hl(0, 'CopilotAnnotation', { fg = '#83a598' })
end

function config.autopairs()
  require('modules.completion.autopairs')
end

function config.autotag()
  require('nvim-ts-autotag').setup({
    enable = true,
  })
end

function config.lspzero()
  require('modules.completion.lspzero')
end

function config.tabnine()
  local tabnine = require('cmp_tabnine.config')
  tabnine:setup({
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = '..',
    ignored_file_types = {
      -- default is not to ignore
      -- uncomment to ignore in lua:
      -- lua = true
    },
    show_prediction_strength = false,
  })
end

return config
