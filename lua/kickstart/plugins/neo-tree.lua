-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\f', ':Neotree reveal right<CR>', desc = 'NeoTree reveal', silent = true },
    { '\\b', ':Neotree buffers reveal right<CR>', desc = 'NeoTree reveal', silent = true },
    { '\\g', ':Neotree git_status reveal right<CR>', desc = 'NeoTree reveal', silent = true },
    { '\\c', ':Neotree close<CR>', desc = 'NeoTree close', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
