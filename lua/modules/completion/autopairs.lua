local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local ts_conds = require('nvim-autopairs.ts-conds')

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
npairs.setup({
  disable_filetype = { 'TelescopePrompt', 'vim' },
  enable_check_bracket_line = false,
  ignored_next_char = '[%w%.]',
  check_ts = true,
  ts_config = {
    lua = { 'string' }, -- it will not add a pair on that treesitter node
    javascript = { 'template_string' },
    java = false, -- don't check treesitter on java
  },
})
-- press % => %% only while inside a comment or string
npairs.add_rules({
  Rule('%', '%', 'lua'):with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
  Rule('$', '$', 'lua'):with_pair(ts_conds.is_not_ts_node({ 'function' })),
})
