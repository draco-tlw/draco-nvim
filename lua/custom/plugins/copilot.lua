return {
  'github/copilot.vim',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    vim.g.copilot_node_command = '/home/draco/.nvm/versions/node/v22.21.0/bin/node'
    -- Disable the default <Tab> mapping so it doesn't conflict
    vim.g.copilot_no_tab_map = true

    -- Map <C-l> to accept the Copilot suggestion
    vim.keymap.set('i', '<C-l>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
    })

    -- Map Alt+] and Alt+[ to cycle through suggestions
    vim.keymap.set('i', '<M-]>', '<Plug>(copilot-next)')
    vim.keymap.set('i', '<M-[>', '<Plug>(copilot-previous)')

    -- Map Ctrl+] to dismiss the suggestion entirely
    vim.keymap.set('i', '<C-]>', '<Plug>(copilot-dismiss)')
  end,
}
