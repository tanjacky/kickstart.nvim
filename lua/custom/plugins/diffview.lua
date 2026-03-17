-- ~/.config/nvim/lua/plugins/diffview.lua (or wherever your plugins are defined)

return {
  'sindrets/diffview.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required
    'nvim-tree/nvim-web-devicons', -- Optional, for file icons
  },
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFileHistory' }, -- Lazy load commands
  keys = {
    -- Keymap to open Diffview for current changes
    { '<leader>gd', ':DiffviewOpen<CR>', desc = 'Open Diffview' },
    -- Keymap to close Diffview
    { '<leader>gc', ':DiffviewClose<CR>', desc = 'Close Diffview' },
    -- Example for merge conflicts: diff HEAD and staged changes
    -- { '<leader>gm', ':DiffviewOpen HEAD~ --cached<CR>', desc = 'Diff HEAD~ cached' },
    -- Example for file history (on the current file)
    -- { '<leader>gh', ':DiffviewFileHistory %<CR>', desc = 'File History (current file)' },
  },
  config = function()
    require('diffview').setup {
      -- You can customize diffview options here.
      -- See :help diffview-config for a full list of options.

      diff_binaries = false, -- Whether to show diffs for binary files
      enhanced_diff_hl = false, -- Enable enhanced diff highlighting (can be resource intensive)
      -- Optional: Configure keymaps *within* the Diffview window
      -- This allows you to customize how you navigate/interact once Diffview is open.
      -- local actions = require("diffview.actions")
      -- keymaps = {
      --   disable_defaults = false, -- Set to true if you want to remap everything
      --   file_panel = {
      --     ['<CR>'] = actions.focus_entry,
      --     ['f'] = actions.focus_entry,
      --     ['d'] = actions.delete_view,
      --   },
      --   diff_view = {
      --     ['<leader>hn'] = actions.next_hunk,
      --     ['<leader>hp'] = actions.prev_hunk,
      --     ['<leader>ha'] = actions.copy_hunk_to_a, -- Copy hunk from current view to "A" side (useful in 3-way merge)
      --     ['<leader>hb'] = actions.copy_hunk_to_b, -- Copy hunk from current view to "B" side
      --     ['<leader>hc'] = actions.conflict_resolve, -- Resolve current conflict (stages the file)
      --     ['<leader>hx'] = actions.cycle_conflict_hunk, -- Cycle through conflict resolutions
      --   },
      -- },
    }
  end,
}
