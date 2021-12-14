--   vim:fileencoding=utf-8:foldmethod=marker
--   
--   Minimap Plugin Configuration dependency for Neovim Config File
--
--   Author: Emilio Rivers (e-Rivers)


-- Configuration {{{

vim.g.minimap_width = 10
vim.g.minimap_highlight = "CursorMinimap"
vim.g.minimap_base_color = "NormalMinimap"
vim.g.minimap_range_color = "RangeMinimap"
vim.g.minimap_highlight_range = 1
vim.g.minimap_close_filetypes = {"dashboard"}

-- }}}

-- Keybindings {{{

vim.api.nvim_set_keymap("n", "<Leader>mo", ":Minimap<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<Leader>mc", ":MinimapClose<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<Leader>mr", ":MinimapRefresh<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<Leader>mm", ":MinimapToggle<CR>", {noremap=true, silent=true})

-- }}}
