local vim = vim
local cmp_status_ok, cmp = pcall(require, 'cmp')
local compare = require('cmp.config.compare')
local defaults = require('cmp.config.default')()
local types = require('luasnip.util.types')

if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
  return
end

luasnip.setup({
  history = true,
  region_check_events = 'CursorHold,InsertLeave',
  -- those are for removing deleted snippets, also a common problem
  delete_check_events = 'TextChanged,InsertEnter',
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { '●', 'GruvboxOrange' } },
      },
    },
    [types.insertNode] = {
      active = {
        virt_text = { { '●', 'GruvboxBlue' } },
      },
    },
  },
})

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

require('luasnip/loaders/from_vscode').lazy_load()

vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })

-- local check_backspace = function()
--   local col = vim.fn.col "." - 1
--   return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
-- end
vim.cmd([[ 
  " gray
  highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
  " blue
  highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
  highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
  " light blue
  highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
  highlight! link CmpItemKindInterface CmpItemKindVariable
  highlight! link CmpItemKindText CmpItemKindVariable
  " pink
  highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
  highlight! link CmpItemKindMethod CmpItemKindFunction
  " front
  highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
  highlight! link CmpItemKindProperty CmpItemKindKeyword
  highlight! link CmpItemKindUnit CmpItemKindKeyword
  ]])

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = '',
  Method = '',
  Function = '',
  Constructor = '',
  Field = '',
  Variable = '',
  Class = '',
  Interface = '',
  Module = '',
  Property = '',
  Unit = '',
  Value = '',
  Enum = '',
  Keyword = '',
  Snippet = '',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = '',
  Event = '',
  Operator = '',
  TypeParameter = '',
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noselect',
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- elseif luasnip.expand_or_locally_jumpable() then
      --   luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      -- elseif luasnip.jumpable(-1) then
      --   luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-k>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-j>'] = cmp.mapping(function(fallback)
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sorting = defaults.sorting,
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      vim_item.kind = kind_icons[vim_item.kind]
      vim_item.menu = ({
        crates = '[CRATES]',
        copilot = '[COPILOT]',
        buffer = '[BUF]',
        nvim_lsp = '[LSP]',
        cmp_tabnine = '[TN]',
        nvim_lua = '[LUA]',
        path = '[PATH]',
        luasnip = '[SNIP]',
      })[entry.source.name]
      if entry.source.name == 'cmp_tabnine' then
        -- local detail = (entry.completion_item.data or {}).detail
        vim_item.kind = ''
        -- if detail and detail:find('.*%%.*') then
        --   vim_item.menu = vim_item.menu .. '' .. detail
        -- end
        if (entry.completion_item.data or {}).multiline then
          vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
        end
      end
      -- vim_item.abbr = vim_item.abbr:match("[^(]+")
      return vim_item
    end,
  },
  sources = {
    { name = 'crates' },
    { name = 'nvim_lsp' },
    { name = 'cmp_tabnine' },
    { name = 'nvim_lua' },
    { name = 'neorg' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
    -- col_offset = -3,
    -- side_padding = 0,
    --  documentation = {
    --  border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    --  },
    completion = cmp.config.window.bordered({ border = 'double' }),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = {
      hl_group = 'CmpGhostText',
    },
  },
})
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})
