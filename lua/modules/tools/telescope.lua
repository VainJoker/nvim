local telescope = require('telescope')
telescope.setup({
  defaults = {
    layout_config = {
      horizontal = { prompt_position = 'top', results_width = 0.6 },
      vertical = { mirror = false },
    },
    sorting_strategy = 'ascending',
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
  },
})
