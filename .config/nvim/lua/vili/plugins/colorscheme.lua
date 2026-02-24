return {
  'sainnhe/gruvbox-material',
  priority = 1000, -- s'assure qu'il est chargé avant les autres plugins
  config = function()
    -- Options spécifiques à gruvbox-material
    vim.g.gruvbox_material_background = 'hard' -- soft, medium, hard
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_transparent_background = 1

    -- Activer le thème
    vim.cmd 'colorscheme gruvbox-material'
  end,
}
-- return {
--   'ellisonleao/gruvbox.nvim',
--   priority = 1000, -- Make sure to load this before all the other start plugins.
--   config = function()
--     ---@diagnostic disable-next-line: missing-fields
--     require('gruvbox').setup {
--       styles = {
--         comments = { italic = false }, -- Disable italics in comments
--         sidebars = 'transparent',
--         floats = 'transparent',
--       },
--       transparent_mode = true,
--     }
--
--     vim.cmd.colorscheme 'gruvbox'
--   end,
-- }
