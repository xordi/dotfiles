-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.window_decorations = 'RESIZE'
config.color_scheme = 'niji'
config.font_size = 12
config.font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'DemiBold', style = 'Normal' })

wezterm.on('update-right-status', function(window, _pane)
  window:set_right_status(window:active_workspace())
end)

wezterm.on('gui-startup', function(cmd)
  local _tab, _pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

config.window_background_opacity = 0.9

-- Tab bar config
config.hide_tab_bar_if_only_one_tab = true

-- Key bindings
config.leader = { key = 'a', mods = 'CTRL' }
config.keys = {
  -- Pane related keybindings
  {
    key = '|',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'j',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'k',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'h',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'j',
    mods = 'ALT',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  },
  {
    key = 'k',
    mods = 'ALT',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 },
  },
  {
    key = 'h',
    mods = 'ALT',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'l',
    mods = 'ALT',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  },
  -- Workspace
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for new workspace' },
      },
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:perform_action(
            wezterm.action.SwitchToWorkspace {
              name = line,
            },
            pane
          )
        end
      end),
    },
  },
  {
    key = 's',
    mods = 'LEADER',
    action = wezterm.action.ShowLauncherArgs {
      flags = 'FUZZY|WORKSPACES'
    }
  }
}

-- and finally, return the configuration to wezterm
return config
