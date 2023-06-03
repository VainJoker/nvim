local config = {}

function config.cmp()
  Prequire('modules.completion.cmp')
end

function config.copilot()
  Prequire('copilot').setup({
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

function config.treesj()
  local tsj = require('treesj')

  local langs = { --[[ configuration for languages ]]
  }

  tsj.setup({
    -- Use default keymaps
    -- (<space>m - toggle, <space>j - join, <space>s - split)
    use_default_keymaps = true,

    -- Node with syntax error will not be formatted
    check_syntax_error = true,

    -- If line after join will be longer than max value,
    -- node will not be formatted
    max_join_length = 120,

    -- hold|start|end:
    -- hold - cursor follows the node/place on which it was called
    -- start - cursor jumps to the first symbol of the node being formatted
    -- end - cursor jumps to the last symbol of the node being formatted
    cursor_behavior = 'hold',

    -- Notify about possible problems or not
    notify = true,
    langs = langs,
  })
end

function config.autopairs()
  Prequire('modules.completion.autopairs')
end

function config.autotag()
  require('nvim-ts-autotag').setup({
    enable = true,
  })
end

function config.lspzero()
  Prequire('modules.completion.lspzero')
end

function config.tabnine()
  local tabnine = Prequire('cmp_tabnine.config')
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
