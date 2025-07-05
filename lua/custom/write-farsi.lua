return {

  write = function()
    local tmp_file = '/tmp/farsi-note.txt'
    os.execute('echo "" > ' .. tmp_file)
    os.execute('gnome-text-editor ' .. tmp_file)
    vim.cmd('r ' .. tmp_file)
  end,

  edit = function()
    local tmp_file = '/tmp/farsi-note.txt'

    -- Yank selection
    vim.cmd 'silent! normal! "zd' -- into "z" register
    local selected_text = vim.fn.getreg 'z'

    local f = io.open(tmp_file, 'w')
    if f then
      f:write(selected_text)
      f:close()
    else
      vim.notify('Error: could not open ' .. tmp_file, vim.log.levels.ERROR)
      return
    end

    os.execute('gnome-text-editor ' .. tmp_file)

    local edited_f = io.open(tmp_file, 'r')
    if not edited_f then
      vim.notify('Error: could not open ' .. tmp_file, vim.log.levels.ERROR)
      return
    end

    local new_content = (edited_f:read '*a'):gsub('^\n+', ''):gsub('\n+$', '')
    edited_f:close()

    vim.fn.setreg('z', new_content)

    -- Replace selection with edited text
    -- vim.cmd 'normal! gv"_d' -- reselect and delete
    vim.cmd 'normal! "zP' -- paste from z register
  end,
}
