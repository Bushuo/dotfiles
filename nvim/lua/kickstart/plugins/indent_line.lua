-- Add indentation guides even on blank lines

---@module 'lazy'
---@type LazySpec
return {
  'lukas-reineke/indent-blankline.nvim',
  -- See `:help ibl`
  main = 'ibl',
  opts = {
    indent = {
      char = '│',
      highlight = {
        'RainbowRed',
        'RainbowYellow',
        'RainbowBlue',
        'RainbowOrange',
        'RainbowGreen',
        'RainbowViolet',
        'RainbowCyan',
      },
    },
  },
  config = function(_, opts)
    local hooks = require 'ibl.hooks'
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#3b2428' })
      vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#3a3328' })
      vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#252d3a' })
      vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#3a2e28' })
      vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#283a2b' })
      vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#322839' })
      vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#253538' })
    end)
    require('ibl').setup(opts)
  end,
}
