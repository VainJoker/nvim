local Hydra = require('hydra')
--local splits = prequire('smart-splits')

local cmd = require('hydra.keymap-util').cmd
local pcmd = require('hydra.keymap-util').pcmd
local gitsigns = require('gitsigns')

local telescope_hint = [[

█▄██▄█          _f_: files       _m_: marks
█▄█▄█▄█▄█▐█┼██▌ _o_: old files   _g_: live grep
███┼█████▐████▌ _p_: projects    _/_: search in file
█████████▐████▌ _r_: resume      _u_: undotree
█████████▐████▌ _h_: vim help    _c_: execute command
█████████▐████▌ _k_: keymaps     _;_: commands history 
                _O_: options     _?_: search history

^
_<Enter>_: Telescope           _<Esc>_
]]

local window_hint = [[
^^^^^^^^^^^^     Move      ^^    Size   ^^   ^^     Split
^^^^^^^^^^^^-------------  ^^-----------^^   ^^---------------
^ ^ _k_ ^ ^  ^ ^ _K_ ^ ^   ^   _<C-k>_   ^   _s_: horizontally 
_h_ ^ ^ _l_  _H_ ^ ^ _L_   _<C-h>_ _<C-l>_   _v_: vertically
^ ^ _j_ ^ ^  ^ ^ _J_ ^ ^   ^   _<C-j>_   ^   _q_, _c_: close
focus^^^^^^  window^^^^^^  ^_=_: equalize^   _z_: maximize
^ ^ ^ ^ ^ ^  ^ ^ ^ ^ ^ ^   ^^ ^          ^   _o_: remain only
_b_: choose buffer
]]

local option_hint = [[
^ ^        Options
^
_v_ %{ve} virtual edit
_i_ %{list} invisible characters  
_s_ %{spell} spell
_w_ %{wrap} wrap
_c_ %{cul} cursor line
_n_ %{nu} number
_r_ %{rnu} relative number
^
^^^^                _<Esc>_
]]
local git_hint = [[
_J_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
_K_: prev hunk   _u_: undo last stage   _p_: preview hunk   _B_: blame show full 
^ ^              _S_: stage buffer      ^ ^                 _/_: show base file
^
^ ^              _<Enter>_: Neogit              _q_: exit
]]

Hydra({
  name = 'Telescope',
  hint = telescope_hint,
  config = {
    color = 'teal',
    invoke_on_body = true,
    hint = {
      position = 'middle',
      border = 'rounded',
    },
  },
  mode = 'n',
  body = '<Leader>f',
  heads = {
    { 'f', cmd('Telescope find_files') },
    { 'g', cmd('Telescope live_grep') },
    { 'o', cmd('Telescope oldfiles'), { desc = 'recently opened files' } },
    { 'h', cmd('Telescope help_tags'), { desc = 'vim help' } },
    { 'm', cmd('MarksListBuf'), { desc = 'marks' } },
    { 'k', cmd('Telescope keymaps') },
    { 'O', cmd('Telescope vim_options') },
    { 'r', cmd('Telescope resume') },
    { 'p', cmd('Telescope projects'), { desc = 'projects' } },
    { '/', cmd('Telescope current_buffer_fuzzy_find'), { desc = 'search in file' } },
    { '?', cmd('Telescope search_history'), { desc = 'search history' } },
    { ';', cmd('Telescope command_history'), { desc = 'command-line history' } },
    { 'c', cmd('Telescope commands'), { desc = 'execute command' } },
    { 'u', cmd('silent! %foldopen! | UndotreeToggle'), { desc = 'undotree' } },
    { '<Enter>', cmd('Telescope'), { exit = true, desc = 'list all pickers' } },
    { '<Esc>', nil, { exit = true, nowait = true } },
  },
})
Hydra({
  name = 'Git',
  hint = git_hint,
  config = {
    buffer = bufnr,
    color = 'pink',
    invoke_on_body = true,
    hint = {
      border = 'rounded',
    },
    on_enter = function()
      vim.cmd('mkview')
      vim.cmd('silent! %foldopen!')
      vim.bo.modifiable = false
      gitsigns.toggle_signs(true)
      gitsigns.toggle_linehl(true)
    end,
    on_exit = function()
      local cursor_pos = vim.api.nvim_win_get_cursor(0)
      vim.cmd('loadview')
      vim.api.nvim_win_set_cursor(0, cursor_pos)
      vim.cmd('normal zv')
      gitsigns.toggle_signs(false)
      gitsigns.toggle_linehl(false)
      gitsigns.toggle_deleted(false)
    end,
  },
  mode = { 'n', 'x' },
  body = '<leader>g',
  heads = {
    {
      'J',
      function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          gitsigns.next_hunk()
        end)
        return '<Ignore>'
      end,
      { expr = true, desc = 'next hunk' },
    },
    {
      'K',
      function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          gitsigns.prev_hunk()
        end)
        return '<Ignore>'
      end,
      { expr = true, desc = 'prev hunk' },
    },
    { 's', ':Gitsigns stage_hunk<CR>', { silent = true, desc = 'stage hunk' } },
    { 'u', gitsigns.undo_stage_hunk, { desc = 'undo last stage' } },
    { 'S', gitsigns.stage_buffer, { desc = 'stage buffer' } },
    { 'p', gitsigns.preview_hunk, { desc = 'preview hunk' } },
    { 'd', gitsigns.toggle_deleted, { nowait = true, desc = 'toggle deleted' } },
    { 'b', gitsigns.blame_line, { desc = 'blame' } },
    {
      'B',
      function()
        gitsigns.blame_line({ full = true })
      end,
      { desc = 'blame show full' },
    },
    { '/', gitsigns.show, { exit = true, desc = 'show base file' } }, -- show the base of the file
    { '<Enter>', '<Cmd>Neogit<CR>', { exit = true, desc = 'Neogit' } },
    { 'q', nil, { exit = true, nowait = true, desc = 'exit' } },
  },
})

Hydra({
  name = 'Options',
  hint = option_hint,
  config = {
    color = 'amaranth',
    invoke_on_body = true,
    hint = {
      border = 'rounded',
      position = 'middle',
    },
  },
  mode = { 'n', 'x' },
  body = '<leader>o',
  heads = {
    {
      'n',
      function()
        if vim.o.number == true then
          vim.o.number = false
        else
          vim.o.number = true
        end
      end,
      { desc = 'number' },
    },
    {
      'r',
      function()
        if vim.o.relativenumber == true then
          vim.o.relativenumber = false
        else
          vim.o.number = true
          vim.o.relativenumber = true
        end
      end,
      { desc = 'relativenumber' },
    },
    {
      'v',
      function()
        if vim.o.virtualedit == 'all' then
          vim.o.virtualedit = 'block'
        else
          vim.o.virtualedit = 'all'
        end
      end,
      { desc = 'virtualedit' },
    },
    {
      'i',
      function()
        if vim.o.list == true then
          vim.o.list = false
        else
          vim.o.list = true
        end
      end,
      { desc = 'show invisible' },
    },
    {
      's',
      function()
        if vim.o.spell == true then
          vim.o.spell = false
        else
          vim.o.spell = true
        end
      end,
      { exit = true, desc = 'spell' },
    },
    {
      'w',
      function()
        if vim.o.wrap ~= true then
          vim.o.wrap = true
          -- Dealing with word wrap:
          -- If cursor is inside very long line in the file than wraps
          -- around several rows on the screen, then 'j' key moves you to
          -- the next line in the file, but not to the next row on the
          -- screen under your previous position as in other editors. These
          -- bindings fixes this.
          vim.keymap.set('n', 'k', function()
            return vim.v.count > 0 and 'k' or 'gk'
          end, { expr = true, desc = 'k or gk' })
          vim.keymap.set('n', 'j', function()
            return vim.v.count > 0 and 'j' or 'gj'
          end, { expr = true, desc = 'j or gj' })
        else
          vim.o.wrap = false
          vim.keymap.del('n', 'k')
          vim.keymap.del('n', 'j')
        end
      end,
      { desc = 'wrap' },
    },
    {
      'c',
      function()
        if vim.o.cursorline == true then
          vim.o.cursorline = false
        else
          vim.o.cursorline = true
        end
      end,
      { desc = 'cursor line' },
    },
    { '<Esc>', nil, { exit = true } },
  },
})

local buffer_hydra = Hydra({
  name = 'Buffer',
  config = {
    on_key = function()
      -- Preserve animation
      vim.wait(200, function()
        vim.cmd('redraw')
      end, 30, false)
    end,
  },
  heads = {
    { 'h', '<Plug>(cokeline-focus-prev)', { desc = 'prev buffer' } },
    { 'l', '<Plug>(cokeline-focus-next)', { desc = 'next buffer' } },
    { '<Esc>', nil, { exit = true } },
  },
})

local function choose_buffer()
  if #vim.fn.getbufinfo({ buflisted = true }) > 1 then
    buffer_hydra:activate()
  end
end

--vim.keymap.set('n', 'gb', choose_buffer, { desc = 'switch buffer' })

Hydra({
  name = 'Windows',
  hint = window_hint,
  config = {
    invoke_on_body = true,
    hint = {
      border = 'rounded',
      offset = -1,
    },
  },
  mode = 'n',
  body = '<leader>w',
  heads = {
    { 'h', '<C-w>h' },
    { 'j', '<C-w>j' },
    { 'k', pcmd('wincmd k', 'E11', 'close') },
    { 'l', '<C-w>l' },

    { 'H', cmd('WinShift left') },
    { 'J', cmd('WinShift down') },
    { 'K', cmd('WinShift up') },
    { 'L', cmd('WinShift right') },

    -- { '<C-h>', function() splihs.resize_left(2)  end },
    -- { '<C-j>', function() splits.resize_down(2)  end },
    -- { '<C-k>', function() splits.resize_up(2)    end },
    -- { '<C-l>', function() splits.resize_right(2) end },
    { '=', '<C-w>=', { desc = 'equalize' } },

    { 's', pcmd('split', 'E36') },
    { '<C-s>', pcmd('split', 'E36'), { desc = false } },
    { 'v', pcmd('vsplit', 'E36') },
    { '<C-v>', pcmd('vsplit', 'E36'), { desc = false } },

    { 'w', '<C-w>w', { exit = true, desc = false } },
    { '<C-w>', '<C-w>w', { exit = true, desc = false } },

    -- { 'z',     cmd 'WindowsMaximaze', { exit = true, desc = 'maximize' } },
    -- { '<C-z>', cmd 'WindowsMaximaze', { exit = true, desc = false } },

    { 'o', '<C-w>o', { exit = true, desc = 'remain only' } },
    { '<C-o>', '<C-w>o', { exit = true, desc = false } },

    { 'b', choose_buffer, { exit = true, desc = 'choose buffer' } },

    { 'c', pcmd('close', 'E444') },
    { 'q', pcmd('close', 'E444'), { desc = 'close window' } },
    { '<C-c>', pcmd('close', 'E444'), { desc = false } },
    { '<C-q>', pcmd('close', 'E444'), { desc = false } },

    { '<Esc>', nil, { exit = true, desc = false } },
  },
})
