local helper = require('core.helper')
local data_dir = string.format('%s/site/', helper.get_data_path())
local lazypath = data_dir .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = ' '

require('lazy').setup({
  require('modules'),
}, {
  defaults = {
    lazy = true, -- should plugins be lazy-loaded?
  },
})
