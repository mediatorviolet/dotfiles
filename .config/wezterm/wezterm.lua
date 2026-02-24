local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- max fps
config.max_fps = 240
config.animation_fps = 240

config.initial_cols = 120
config.initial_rows = 28

-- permet d'utiliser left_option pour écrire des caractères spéciaux
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

--[[
============================
Custom Configuration
============================
]]
--

-- Rounded or Square Style Tabs

-- change to square if you don't like rounded tab style
local tab_style = 'square'

-- leader active indicator prefix
local leader_prefix = utf8.char(0x1f47e) -- space invader

config.scrollback_lines = 3500
config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
    mods = 'NONE',
    action = wezterm.action.ScrollByLine(-3),
    alt_screen = false,
  },
  {
    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
    mods = 'NONE',
    action = wezterm.action.ScrollByLine(3),
    alt_screen = false,
  },
}

--[[
============================
Font
============================
]]
--

config.font = wezterm.font 'JetBrains Mono NL'
config.font_size = 14

config.window_decorations = 'RESIZE'

--[[
============================
Colors
============================
]]
--

config.window_background_opacity = 1
config.macos_window_background_blur = 70

local color_scheme = 'Gruvbox Material (Gogh)'
config.color_scheme = color_scheme

-- color_scheme not sufficient in providing available colors
-- local colors = wezterm.color.get_builtin_schemes()[color_scheme]
-- {
--     "name": "Gruvbox Material Dark",
--     "author": "",
--     "variant": "",
--     "color_01": "#3C3836",
--     "color_02": "#EA6962",
--     "color_03": "#A9B665",
--     "color_04": "#D8A657",
--     "color_05": "#7DAEA3",
--     "color_06": "#D3869B",
--     "color_07": "#89B482",
--     "color_08": "#D4BE98",
--     "color_09": "#3C3836",
--     "color_10": "#EA6962",
--     "color_11": "#A9B665",
--     "color_12": "#D8A657",
--     "color_13": "#7DAEA3",
--     "color_14": "#D3869B",
--     "color_15": "#89B482",
--     "color_16": "#D4BE98",
--     "background": "#282828",
--     "foreground": "#D4BE98",
--     "cursor": "#D4BE98",
--     "hash": "b4215026b0d70de8f2b8fab353cbd3ca84473942d88e9b03d582691d0907d037"
--   },
-- color scheme colors for easy access
local scheme_colors = {
  gruvbox = {
    soft = {
      mmmm = '32302f',
      mmm = '282828',
      mm = '504945',
      m = '665c54',
      p = 'bdae93',
      pp = 'd5c4a1',
      ppp = 'ebdbb2',
      pppp = 'D4BE98',
      red = 'fb4934',
      orange = 'fe8019',
      yellow = 'fabd2f',
      green = 'b8bb26',
      aqua = '8ec07c',
      blue = '83a598',
      purple = 'd3869b',
      brown = 'd65d0e',
    },
  },
}

local colors = {
  border = scheme_colors.gruvbox.soft.mmmm,
  tab_bar_active_tab_fg = scheme_colors.gruvbox.soft.pppp,
  tab_bar_active_tab_bg = scheme_colors.gruvbox.soft.pppp,
  tab_bar_inactive_tab_fg = scheme_colors.gruvbox.soft.mm,
  tab_bar_inactive_tab_bg = scheme_colors.gruvbox.soft.mm,
  tab_bar_text = scheme_colors.gruvbox.soft.mmmm,
  tab_bar_incative_text = scheme_colors.gruvbox.soft.p,
  arrow_foreground_leader = scheme_colors.gruvbox.soft.yellow,
  arrow_background_leader = scheme_colors.gruvbox.soft.mm,
  tab_bar_bg = scheme_colors.gruvbox.soft.mmm,
}

--[[
============================
Border
============================
]]
--

config.window_frame = {
  -- border_left_width = '0.4cell',
  -- border_right_width = '0.4cell',
  -- border_bottom_height = '0.15cell',
  -- border_top_height = '0.15cell',
  -- border_left_color = colors.border,
  -- border_right_color = colors.border,
  -- border_bottom_color = colors.border,
  -- border_top_color = colors.border,
}

--[[
============================
Window
============================
]]
--

config.window_padding = {
  left = 30,
  right = 30,
  top = 30,
  bottom = 5,
}

--[[
============================
Shortcuts
============================
]]
--

-- shortcut_configuration
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 2000 }
config.keys = {
  {
    mods = 'LEADER',
    key = 'c',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  {
    mods = 'LEADER',
    key = 'x',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    mods = 'LEADER',
    key = 'p',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    mods = 'LEADER',
    key = 'n',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    mods = 'LEADER',
    key = '|',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    mods = 'LEADER',
    key = '-',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    mods = 'LEADER',
    key = 'h',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    mods = 'LEADER',
    key = 'j',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    mods = 'LEADER',
    key = 'k',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    mods = 'LEADER',
    key = 'l',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    mods = 'LEADER',
    key = 'LeftArrow',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  {
    mods = 'LEADER',
    key = 'RightArrow',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  },
  {
    mods = 'LEADER',
    key = 'DownArrow',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  },
  {
    mods = 'LEADER',
    key = 'UpArrow',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 },
  },
}

for i = 1, 9 do
  -- leader + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(i),
  })
end

--[[
============================
Tab Bar
============================
]]
--

-- tab bar
config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = false
config.colors = {
  tab_bar = {
    background = colors.tab_bar_bg,
    new_tab = {
      bg_color = colors.tab_bar_inactive_tab_bg,
      fg_color = colors.tab_bar_incative_text,
    },
  },
}

local function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local title = ' ' .. tab.tab_index .. ': ' .. tab_title(tab) .. ' '
  local left_edge_text = ''
  local right_edge_text = ''

  if tab_style == 'rounded' then
    title = tab.tab_index .. ': ' .. tab_title(tab)
    title = wezterm.truncate_right(title, max_width - 2)
    left_edge_text = wezterm.nerdfonts.ple_left_half_circle_thick
    right_edge_text = wezterm.nerdfonts.ple_right_half_circle_thick
  end

  -- ensure that the titles fit in the available space,
  -- and that we have room for the edges.
  -- title = wezterm.truncate_right(title, max_width - 2)

  if tab.is_active then
    return {
      { Background = { Color = colors.tab_bar_active_tab_bg } },
      { Foreground = { Color = colors.tab_bar_active_tab_fg } },
      { Text = left_edge_text },
      { Background = { Color = colors.tab_bar_active_tab_fg } },
      { Foreground = { Color = colors.tab_bar_text } },
      { Text = title },
      { Background = { Color = colors.tab_bar_active_tab_bg } },
      { Foreground = { Color = colors.tab_bar_active_tab_fg } },
      { Text = right_edge_text },
    }
  else
    return {
      { Background = { Color = colors.tab_bar_inactive_tab_bg } },
      { Foreground = { Color = colors.tab_bar_inactive_tab_fg } },
      { Text = left_edge_text },
      { Background = { Color = colors.tab_bar_inactive_tab_fg } },
      { Foreground = { Color = colors.tab_bar_incative_text } },
      { Text = title },
      { Background = { Color = colors.tab_bar_inactive_tab_bg } },
      { Foreground = { Color = colors.tab_bar_inactive_tab_fg } },
      { Text = right_edge_text },
    }
  end
end)

--[[
============================
Leader Active Indicator
============================
]]
--

wezterm.on('update-status', function(window, _)
  -- leader inactive
  local solid_left_arrow = ''
  local arrow_foreground = { Foreground = { Color = colors.arrow_foreground_leader } }
  local arrow_background = { Background = { Color = colors.arrow_background_leader } }
  local prefix = ''

  -- leaader is active
  if window:leader_is_active() then
    prefix = ' ' .. leader_prefix .. ' '

    if tab_style == 'rounded' then
      solid_left_arrow = wezterm.nerdfonts.ple_right_half_circle_thick
    else
      solid_left_arrow = wezterm.nerdfonts.pl_left_hard_divider
    end

    local tabs = window:mux_window():tabs_with_info()

    if tab_style ~= 'rounded' then
      for _, tab_info in ipairs(tabs) do
        if tab_info.is_active and tab_info.index == 0 then
          arrow_background = { Foreground = { Color = colors.tab_bar_active_tab_fg } }
          solid_left_arrow = wezterm.nerdfonts.pl_right_hard_divider
          break
        end
      end
    end
  end

  window:set_left_status(wezterm.format {
    { Background = { Color = colors.arrow_foreground_leader } },
    { Text = prefix },
    arrow_foreground,
    arrow_background,
    { Text = solid_left_arrow },
  })
end)

-- Finally, return the configuration to wezterm:
return config
