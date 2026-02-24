---@module "lazy"
---@type LazySpec
return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  event = { 'InsertEnter', 'CmdlineEnter' },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    fuzzy = {
      implementation = 'prefer_rust_with_warning',
      max_typos = function(keyword)
        return math.floor(#keyword / 4)
      end,
      frecency = {
        enabled = true,
        path = vim.fn.stdpath 'state' .. '/blink/cmp/frecency.dat',
        unsafe_no_lock = false,
      },
      use_proximity = false,
    },
    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = 'normal',
    },
    cmdline = {},
    completion = {
      accept = { auto_brackets = { enabled = true } },
      documentation = {
        auto_show = false,
        auto_show_delay_ms = 250,
        treesitter_highlighting = true,
        update_delay_ms = 50,
        window = { border = 'rounded' },
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
      menu = {
        border = 'rounded',
        draw = {
          columns = {
            { 'label', 'label_description', gap = 1 },
            { 'kind_icon', 'kind' },
          },
          treesitter = { 'lsp' },
        },
      },
      trigger = { show_in_snippet = false },
    },

    keymap = {
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },

      ['<Tab>'] = {
        function(cmp)
          return cmp.select_next()
        end,
        'snippet_forward',
        'fallback',
      },
      ['<S-Tab>'] = {
        function(cmp)
          return cmp.select_prev()
        end,
        'snippet_backward',
        'fallback',
      },

      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },
      ['<C-up>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-down>'] = { 'scroll_documentation_down', 'fallback' },
    },

    signature = {
      enabled = true,
      window = { border = 'rounded', show_documentation = false },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        lsp = {
          min_keyword_length = 2,
          score_offset = 0,
        },
        path = {
          min_keyword_length = 2,
        },
        snippets = {
          min_keyword_length = 2,
        },
        buffer = {
          min_keyword_length = 4,
          max_items = 5,
        },
      },
    },
  },
}
