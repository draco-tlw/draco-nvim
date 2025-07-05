local map = vim.keymap.set

map('n', '<leader>e', vim.cmd.Ex, { desc = 'Explorer' })

map('n', '<leader>c', function()
  require('Comment.api').toggle.linewise.current()
end, { noremap = true, silent = true, desc = 'Toggle comment' })

map('v', '<leader>c', function()
  local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
  vim.api.nvim_feedkeys(esc, 'nx', false)
  require('Comment.api').toggle.linewise(vim.fn.visualmode())
end, { noremap = true, silent = true, desc = 'Toggle comment (visual)' })

local write_farsi = require 'custom.write-farsi'
map('n', '<leader>wf', write_farsi.write, { noremap = true, silent = true, desc = 'Write farsi' })
map('v', '<leader>wf', write_farsi.edit, { noremap = true, silent = true, desc = 'Write farsi' })
