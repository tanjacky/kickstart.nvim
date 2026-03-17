-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    'nvim-telescope/telescope.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          -- === Override / to use Telescope for fuzzy finding ===
          --          ['/'] = 'telescope',
          ['#'] = 'telescope',
        },
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        -- set to `true` if you want directories to stay expanded when following
      },
      filtered_items = {
        hide_dotfiles = false,
        hide_git_ignored = false,
        hide_hidden = true,
      },
      -- === Add custom commands for Telescope integration ===
      commands = {
        telescope = function(state)
          local current_node = state.tree:get_node()
          local path = current_node.path
          -- If the current node is a directory, start Telescope from there
          if current_node.type == 'directory' then
            require('telescope.builtin').find_files {
              cwd = path,
            }
          else -- Otherwise, start from the parent directory of the current file
            require('telescope.builtin').find_files {
              cwd = vim.fn.fnamemodify(path, ':h'),
              --              default_text = vim.fn.fnamemodify(path, ':t'), -- Pre-fill with current filename
            }
          end
        end,
      },
      -- ====================================================
    },
  },
}
