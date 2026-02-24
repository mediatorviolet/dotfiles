-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  To update plugins you can run
--    :Lazy update

require('lazy').setup({
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

  require 'vili.plugins.gitsigns',

  require 'vili.plugins.which-key',

  require 'vili.plugins.telescope',

  require 'vili.plugins.telescope-undo',

  require 'vili.plugins.lspconfig',

  require 'vili.plugins.conform',

  require 'vili.plugins.blink-cmp',

  require 'vili.plugins.colorscheme',

  require 'vili.plugins.todo-comments',

  require 'vili.plugins.mini',

  require 'vili.plugins.treesitter',

  require 'vili.plugins.treesitter-context',

  require 'vili.plugins.treesitter-textobjects',

  require 'vili.plugins.autotag',

  require 'vili.plugins.autopairs',

  require 'vili.plugins.harpoon',

  require 'vili.plugins.neo-tree',

  -- require 'vili.plugins.render-markdown',

  require 'vili.plugins.alpha',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
