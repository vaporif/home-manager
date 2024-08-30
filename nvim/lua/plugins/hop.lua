return {
  'smoka7/hop.nvim',
  version = '*',
  opts = {
    keys = 'etovxqpdygfblzhckisuran',
  },
  keys = {
    {
      '<leader>fq',
      function()
        require('hop').hint_words()
      end,
      mode = { 'n', 'x', 'o' },
      desc = '[S]earch [Q]uick Hop',
    },
  },
}
