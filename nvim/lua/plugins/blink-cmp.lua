return {
  'saghen/blink.cmp',
  enabled = true,
  version = '1.1.1',
  dependencies = {
    'Kaiser-Yang/blink-cmp-dictionary',
  },
  opts = function(_, opts)
    opts.sources = vim.tbl_deep_extend('force', opts.sources or {}, {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
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
          min_keyword_length = 3,
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
          opts = {
            get_bufnrs = function()
              return vim.tbl_filter(function(bufnr)
                return vim.bo[bufnr].buftype == ''
              end, vim.api.nvim_list_bufs())
            end,
          },
        },
        snippets = {
          name = 'snippets',
          enabled = true,
          max_items = 10,
          min_keyword_length = 2,
          module = 'blink.cmp.sources.snippets',
          score_offset = 85, -- the higher the number, the higher the priority
          -- Only show snippets if I type the trigger_text characters, so
          -- to expand the "bash" snippet, if the trigger_text is ";" I have to
        },
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        -- not sure i like it
        -- dictionary = {
        --   module = 'blink-cmp-dictionary',
        --   name = 'Dict',
        --   score_offset = 20, -- the higher the number, the higher the priority
        --   enabled = true,
        --   max_items = 8,
        --   min_keyword_length = 3,
        --   opts = {
        --     dictionary_directories = { vim.fn.expand '~/.local/share/blink-cmp-dict/' },
        --   },
        -- },
      },
    })

    opts.appearance = { nerd_font_variant = 'mono' }

    opts.cmdline = {
      enabled = true,
    }

    opts.signature = { enabled = true }

    opts.completion = {
      trigger = {
        show_on_trigger_character = true,
      },
      menu = {
        draw = {
          padding = { 0, 1 }, -- padding only on right side
          components = {
            kind_icon = {
              text = function(ctx)
                return ' ' .. ctx.kind_icon .. ctx.icon_gap .. ' '
              end,
            },
          },
        },
      },
      documentation = {
        auto_show = true,
      },
    }

    opts.fuzzy = { implementation = 'rust' }

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
