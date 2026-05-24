return {
  'numToStr/Comment.nvim',
  lazy = false,
  opts = {
    pre_hook = function()
      return vim.bo.commentstring
    end,
  },
}
