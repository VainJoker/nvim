local config = {}

function config.lspsaga()
  prequire('lspsaga').setup({
    outline = {
      win_position = 'right',
      win_with = '',
      win_width = 30,
      show_detail = false,
      auto_preview = false,
      auto_refresh = true,
      auto_close = true,
      custom_sort = nil,
      keys = {
        jump = 'o',
        expand_collapse = 'u',
        quit = 'q',
      },
    },
    lightbulb = {
      enable = true,
      enable_in_insert = false,
      sign = false,
      sign_priority = 40,
      virtual_text = true,
    },
    ui = {
      -- currently only round theme
      theme = 'round',
      -- border type can be single,double,rounded,solid,shadow.
      border = 'solid',
      winblend = 0,
      expand = '',
      collapse = '',
      preview = ' ',
      code_action = '💡',
      diagnostic = '🐞',
      incoming = ' ',
      outgoing = ' ',
      colors = {
        --float window normal bakcground color
        normal_bg = '#262626',
        --title background color
        title_bg = '#afd700',
        red = '#e95678',
        magenta = '#b33076',
        orange = '#FF8700',
        yellow = '#f7bb3b',
        green = '#afd700',
        cyan = '#36d0e0',
        blue = '#61afef',
        purple = '#CBA6F7',
        white = '#d1d4cf',
        black = '#1c1c19',
      },
      kind = {},
    },
  })
  local augroup = vim.api.nvim_create_augroup
  local autocmd = vim.api.nvim_create_autocmd
  local term = require('lspsaga.floaterm')
  -- Auto close terminal
  local auto_close_terminal = augroup('AutoCloseTerminal', { clear = true })
  autocmd({ 'TermClose' }, {
    group = auto_close_terminal,
    pattern = { '*' },
    callback = function()
      local current_bufnr = vim.fn.expand('<abuf>')
      if term.term_bufnr == tonumber(current_bufnr) then
        term.first_open = nil
        vim.api.nvim_buf_delete(term.term_bufnr, { force = true })
        term.term_bufnr, term.term_winid = nil, nil
        vim.api.nvim_buf_delete(term.shadow_bufnr, { force = true })
        term.shadow_bufnr, term.shadow_winid = nil, nil
      else
        return vim.fn.execute('bdelete! ' .. current_bufnr)
      end
    end,
  })
end

function config.rust()
  local extension_path = vim.env.HOME .. '/.local/share/nvim/mason/packages/codelldb/'
  local codelldb_path = extension_path .. 'adapter/codelldb'
  local liblldb_path = vim.fn.has('mac') == 1 and extension_path .. 'lldb/lib/liblldb.dylib'
    or extension_path .. 'lldb/lib/liblldb.so'
  local adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)

  prequire('rust-tools').setup({
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
      inlay_hints = {
        auto = false,
      },
    },
  })
end

function config.go()
  prequire('go').setup()
end

function config.treesitter()
  prequire('nvim-treesitter.configs').setup({
    -- A list of parser names, or "all"
    ensure_installed = 'all',
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
    highlight = {
      enable = true,
    },
  })
end

return config
