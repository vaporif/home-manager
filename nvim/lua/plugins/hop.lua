return {
  'smoka7/hop.nvim',
  version = '*',
  opts = {
    keys = 'etovxqpdygfblzhckisuran',
  },
  keys = {
    {
      '<leader>q',
      function()
        require('hop').hint_words()
      end,
      mode = { 'n', 'x', 'o' },
      desc = '[Q]uick Hop',
    },
  },
}
