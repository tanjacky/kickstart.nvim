-- ~/.config/nvim/lua/plugins/auto-dark-mode.lua (or similar)

return {
  'f-person/auto-dark-mode.nvim',
  opts = {
    -- Configuration options for auto-dark-mode.nvim
    -- Refer to the plugin's documentation for all options: :help auto-dark-mode.nvim

    -- How frequently the system appearance is checked (in milliseconds).
    -- Default is 3000 (3 seconds). Adjust if needed.
    update_interval = 60000, -- Check every 60 seconds

    -- Function called when the system switches to dark mode.
    -- This is where you set your dark colorscheme.
    set_dark_mode = function()
      vim.o.background = 'dark' -- Ensure background option is dark
      --      vim.cmd 'colorscheme tokyonight' -- Replace 'tokyonight' with your preferred dark theme
      vim.cmd 'colorscheme catppuccin-frappe'
      -- You might also want to set specific highlights for your dark theme here if needed
    end,

    -- Function called when the system switches to light mode.
    -- This is where you set your light colorscheme.
    set_light_mode = function()
      vim.o.background = 'light' -- Ensure background option is light
      --      vim.cmd 'colorscheme tokyonight-day' -- Replace 'tokyonight-day' with your preferred light theme
      vim.cmd 'colorscheme catppuccin-latte'
      -- Or if your colorscheme auto-detects background, just:
      -- vim.cmd("colorscheme my_light_theme_name")
    end,

    -- Fallback appearance ("dark" | "light") to use if auto-detection fails
    -- (e.g., when connecting via SSH to a TTY).
    fallback = 'dark',
  },
}
