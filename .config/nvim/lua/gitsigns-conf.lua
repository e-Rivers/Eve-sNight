--   vim:fileencoding=utf-8:foldmethod=marker
--
--   Gitsigns Plugin Configuration dependency for Neovim Config File
--
--   Author: Emilio Rivers (e-Rivers)


-- Configuration {{{

require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = ' █'},
    change       = {hl = 'GitSignsChange', text = ' █'},
    delete       = {hl = 'GitSignsDelete', text = ' █'},
    topdelete    = {hl = 'GitSignsDelete', text = ' █'},
    changedelete = {hl = 'GitSignsChange', text = ' █'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  keymaps = {

-- Keybindings {{{

    -- Default keymap options
    noremap = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},

    ['n <Leader>hs'] = '<cmd>Gitsigns stage_hunk<CR>',
    ['v <Leader>hs'] = ':Gitsigns stage_hunk<CR>',
    ['n <Leader>hu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
    ['n <Leader>hr'] = '<cmd>Gitsigns reset_hunk<CR>',
    ['v <Leader>hr'] = ':Gitsigns reset_hunk<CR>',
    ['n <Leader>hR'] = '<cmd>Gitsigns reset_buffer<CR>',
    ['n <Leader>hp'] = '<cmd>Gitsigns preview_hunk<CR>',
    ['n <Leader>hb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
    ['n <Leader>hS'] = '<cmd>Gitsigns stage_buffer<CR>',
    ['n <Leader>hU'] = '<cmd>Gitsigns reset_buffer_index<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>Gitsigns select_hunk<CR>',
    ['x ih'] = ':<C-U>Gitsigns select_hunk<CR>'

-- }}}

  },
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}

-- }}}


