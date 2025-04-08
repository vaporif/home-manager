-- NOTE: Specify the trigger character(s) used for luasnip
local trigger_text = ';'

return {
  'saghen/blink.cmp',
  enabled = true,
  version = '1.1.1',
  dependencies = {
    'Kaiser-Yang/blink-cmp-dictionary',
  },
  opts = function(_, opts)
    -- I noticed that telescope was extremeley slow and taking too long to open,
    -- assumed related to blink, so disabled blink and in fact it was related
    -- :lua print(vim.bo[0].filetype)
    -- So I'm disabling blink.cmp for Telescope
    opts.enabled = function()
      -- Get the current buffer's filetype
      local filetype = vim.bo[0].filetype
      -- Disable for Telescope buffers
      if filetype == 'TelescopePrompt' or filetype == 'minifiles' or filetype == 'snacks_picker_input' then
        return false
      end
      return true
    end
    opts.sources = vim.tbl_deep_extend('force', opts.sources or {}, {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'dictionary' },
      providers = {
        lsp = {
          name = 'lsp',
          enabled = true,
          module = 'blink.cmp.sources.lsp',
          score_offset = 90, -- the higher the number, the higher the priority
        },
        path = {
          name = 'Path',
          module = 'blink.cmp.sources.path',
          score_offset = 25,
          fallbacks = { 'snippets', 'buffer' },
          opts = {
            trailing_slash = false,
            label_trailing_slash = true,
            get_cwd = function(context)
              return vim.fn.expand(('#%d:p:h'):format(context.bufnr))
            end,
            show_hidden_files_by_default = true,
          },
        },
        buffer = {
          name = 'Buffer',
          enabled = true,
          max_items = 3,
          module = 'blink.cmp.sources.buffer',
          min_keyword_length = 2,
          score_offset = 15, -- the higher the number, the higher the priority
        },
        snippets = {
          name = 'snippets',
          enabled = true,
          max_items = 15,
          min_keyword_length = 2,
          module = 'blink.cmp.sources.snippets',
          score_offset = 85, -- the higher the number, the higher the priority
          -- Only show snippets if I type the trigger_text characters, so
          -- to expand the "bash" snippet, if the trigger_text is ";" I have to
        },
        dictionary = {
          module = 'blink-cmp-dictionary',
          name = 'Dict',
          score_offset = 20, -- the higher the number, the higher the priority
          enabled = true,
          max_items = 8,
          min_keyword_length = 3,
          opts = {
            dictionary_directories = { vim.fn.expand '~/.local/share/blink-cmp-dict/' },
          },
        },
      },
    })

    opts.cmdline = {
      enabled = true,
    }

    opts.completion = {
      -- accept = {
      --   auto_brackets = {
      --     enabled = true,
      --     default_brackets = { ";", "" },
      --     override_brackets_for_filetypes = {
      --       markdown = { ";", "" },
      --     },
      --   },
      -- },
      --   keyword = {
      --     -- 'prefix' will fuzzy match on the text before the cursor
      --     -- 'full' will fuzzy match on the text before *and* after the cursor
      --     -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
      --     range = "full",
      --   },
      menu = {
        border = 'single',
      },
      documentation = {
        auto_show = true,
        window = {
          border = 'single',
        },
      },
    }

    opts.fuzzy = { implementation = 'rust' }
    -- opts.fuzzy = {
    --   -- Disabling this matches the behavior of fzf
    --   use_typo_resistance = false,
    --   -- Frecency tracks the most recently/frequently used items and boosts the score of the item
    --   use_frecency = true,
    --   -- Proximity bonus boosts the score of items matching nearby words
    --   use_proximity = false,
    -- }

    -- opts.snippets = {
    --   preset = 'luasnip', -- Choose LuaSnip as the snippet engine
    -- }

    -- -- To specify the options for snippets
    -- opts.sources.providers.snippets.opts = {
    --   use_show_condition = true, -- Enable filtering of snippets dynamically
    --   show_autosnippets = true, -- Display autosnippets in the completion menu
    -- }

    opts.keymap = {
      preset = 'enter',
      ['<Tab>'] = { 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      ['<C-y>'] = { 'select_and_accept' },

      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },

      ['<S-k>'] = { 'scroll_documentation_up', 'fallback' },
      ['<S-j>'] = { 'scroll_documentation_down', 'fallback' },

      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },
    }

    return opts
  end,
}
