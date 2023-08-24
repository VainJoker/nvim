local vim = vim
local home = os.getenv('HOME')
local cache_dir = home .. '/.cache/nvim/';

(function()
  local data_dir = {
    cache_dir .. 'backup',
    cache_dir .. 'session',
    cache_dir .. 'swap',
    cache_dir .. 'tags',
    cache_dir .. 'undo',
  }
  if vim.fn.isdirectory(cache_dir) == 0 then
    os.execute('mkdir -p ' .. cache_dir)
    for _, v in pairs(data_dir) do
      if vim.fn.isdirectory(v) == 0 then
        os.execute('mkdir -p ' .. v)
      end
    end
  end
end)()

function _G.prequire(...)
  local status, lib = pcall(require, ...)
  if status then
    return lib
  else
    vim.notify('Failed to load: ' .. ...)
    return
  end
end

vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', ' ', '', { noremap = true })
vim.api.nvim_set_keymap('x', ' ', '', { noremap = true })

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
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
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})
