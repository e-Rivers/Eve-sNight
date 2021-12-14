--   vim:fileencoding=utf-8:foldmethod=marker
--
--   Colorizer Plugin Configuration dependency for Neovim Config File
--
--   Author: Emilio Rivers (e-Rivers)


-- Configuration {{{

require 'colorizer'.setup({}, {
    RGB      = true;         -- #RGB hex codes
	RRGGBB   = true;         -- #RRGGBB hex codes
	names    = false;        -- "Name" codes like Blue
	RRGGBBAA = true;        -- #RRGGBBAA hex codes
	rgb_fn   = true;        -- CSS rgb() and rgba() functions
	hsl_fn   = false;        -- CSS hsl() and hsla() functions
	css      = false;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn   = false;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
	-- Available modes: foreground, background
	mode     = 'background'; -- Set the display mode.
})

-- }}}

-- Keybindings {{{

vim.api.nvim_set_keymap("n", "<Leader>cc", ":ColorizerToggle<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<Leader>cr", ":ColorizerReloadAllBuffers<CR>", {noremap=true, silent=true})

-- }}}
