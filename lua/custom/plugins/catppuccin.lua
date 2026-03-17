-- In your Catppuccin setup (e.g., ~/.config/nvim/lua/plugins/catppuccin.lua)

return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  -- ... other setup options like version, lazy, background, etc. ...
  config = function()
    require('catppuccin').setup {
      --     flavour = "mocha", -- or "frappe", "macchiato", "latte"
      --    background = {
      --     light = "latte",
      --    dark = "mocha",
      -- },
      transparent_background = false,
      term_colors = false, -- Recommended
      integrations = {
        -- Ensure Neo-tree integration is enabled if you want Catppuccin to theme other parts of Neo-tree
        nvimtree = true, -- This is for nvim-tree.lua, but sometimes affects similar plugins
        -- neotree = true, -- Check if catppuccin offers a direct neotree integration setting if 'nvimtree' doesn't work for you.
        -- The current `catppuccin/nvim` repo lists `nvimtree = true`, so it's the one to use.
      },
      -- === ADD THIS SECTION ===
      custom_highlights = function(colors)
        return {
          -- NeoTreeCursorLine is the highlight group for the current row in Neo-tree
          NeoTreeCursorLine = {
            bg = colors.surface0, -- Example: use surface0 as background color
            -- You can also set foreground (text) color if needed:
            -- fg = colors.text,
            --style = 'bold', -- Optional: make text bold
          },
          -- You might also want to adjust this for when NeoTree is not focused:
          NeoTreeCursorLineNC = {
            bg = colors.crust, -- Example: a slightly different background for non-focused tree
          },
          -- You may also want to control the background of the tree itself
          -- NeoTreeNormal = {
          --   fg = colors.text,
          --   bg = colors.base, -- Set the overall background of the Neo-tree window
          -- },
          -- NeoTreeNormalNC = {
          --   fg = colors.text,
          --   bg = colors.mantle, -- Background for non-current Neo-tree windows (if you have multiple)
          -- },
        }
      end,
      -- ========================
      color_overrides = {
        latte = {
          base = '#fbf6e4',
          mantle = '#f5f0de',
          crust = '#000000',
        },
      },
    }
  end,
}
