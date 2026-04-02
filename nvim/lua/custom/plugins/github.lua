---@module 'lazy'
---@type LazySpec
return {
  {
    'pwntester/octo.nvim',
    cmd = { 'Octo' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      { 'nvim-tree/nvim-web-devicons', optional = true },
    },
    opts = {
      enable_builtin = true,
      picker = 'telescope',
    },
    keys = {
      { '<leader>po', '<cmd>Octo search is:pr<CR>', desc = '[P]ull Request [O]pen/Search' },
      { '<leader>pc', '<cmd>Octo pr<CR>', desc = '[P]ull Request [C]urrent' },
      { '<leader>pl', '<cmd>Octo pr list<CR>', desc = '[P]ull Request [L]ist' },
      { '<leader>pr', '<cmd>Octo review<CR>', desc = '[P]ull Request [R]eview' },
    },
  },
  {
    'NeogitOrg/neogit',
    cmd = { 'Neogit' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
    },
    opts = {
      integrations = {
        diffview = true,
      },
    },
    keys = {
      {
        '<leader>gs',
        function()
          require('neogit').open()
        end,
        desc = '[G]it [S]tatus',
      },
    },
  },
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewClose', 'DiffviewFileHistory', 'DiffviewFocusFiles', 'DiffviewLog', 'DiffviewOpen' },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<CR>', desc = '[G]it [D]iff' },
      { '<leader>gf', '<cmd>DiffviewFileHistory %<CR>', desc = '[G]it [F]ile History' },
    },
  },
  {
    'folke/which-key.nvim',
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { '<leader>g', group = '[G]it' },
        { '<leader>p', group = '[P]ull Request' },
      })
      return opts
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    ---@module 'gitsigns'
    ---@type Gitsigns.Config
    opts = function(_, opts)
      local previous_on_attach = opts.on_attach

      opts.on_attach = function(bufnr)
        if previous_on_attach then
          previous_on_attach(bufnr)
        end

        local gitsigns = require 'gitsigns'

        local function map(mode, lhs, rhs, map_opts)
          map_opts = map_opts or {}
          map_opts.buffer = bufnr
          vim.keymap.set(mode, lhs, rhs, map_opts)
        end

        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git [c]hange' })

        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'git [s]tage hunk' })

        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'git [r]eset hunk' })

        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
        map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'git [u]ndo stage hunk' })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
        map('n', '<leader>hb', gitsigns.blame_line, { desc = 'git [b]lame line' })
        map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
        map('n', '<leader>hD', function()
          gitsigns.diffthis '@'
        end, { desc = 'git [D]iff against last commit' })

        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
        map('n', '<leader>tD', gitsigns.preview_hunk_inline, { desc = '[T]oggle git show [D]eleted' })
      end

      return opts
    end,
  },
}
