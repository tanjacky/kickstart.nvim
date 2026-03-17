-- ~/.config/nvim/lua/plugins/neogit.lua (or directly in your init.lua's lazy.nvim setup)

return {
  'TimUntersberger/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required
    'sindrets/diffview.nvim', -- Highly recommended for visual diffs
    'nvim-tree/nvim-web-devicons', -- For icons
  },
  cmd = 'Neogit', -- Lazy load the plugin when :Neogit command is used
  keys = {
    -- Map a convenient key to open Neogit's status buffer
    { '<leader>gs', ':Neogit<CR>', desc = 'Neogit Status' },
  },
  config = function()
    require('neogit').setup {
      -- Your Neogit configuration options go here
      -- See :help neogit-settings for a full list

      integrations = {
        -- Set this to true to use diffview.nvim for diffs opened from Neogit
        -- This is highly recommended for a better diff experience.
        diffview = true,
      },

      -- Other common configurations:
      -- live_mode_style = "signs", -- Or "float", "popup"
      -- disable_signs = false,     -- Show Git signs in the Neogit buffer
      -- disable_hint = false,      -- Show help hints at the bottom
      -- disable_action_groups = false, -- Group actions (stage/unstage etc.)
      -- auto_refresh = true,       -- Automatically refresh status when files change

      -- You can also customize keymaps within Neogit's status buffer:
      -- mappings = {
      --   finder = { "f", "l" },
      --   toggle_diff = "d",
      --   toggle_stage_file = "s",
      --   toggle_hunk = "s",
      --   -- etc.
      -- }
    }
  end,
}
