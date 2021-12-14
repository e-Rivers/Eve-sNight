--   vim:fileencoding=utf-8:foldmethod=marker
--   
--   ░█▀█░█▀▀░█▀█░█░█░▀█▀░█▄█░░░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀
--   ░█░█░█▀▀░█░█░▀▄▀░░█░░█░█░░░█░░░█░█░█░█░█▀▀░░█░░█░█
--   ░▀░▀░▀▀▀░▀▀▀░░▀░░▀▀▀░▀░▀░░░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀
--   
--   Author: Emilio Rivers (e-Rivers)

-- Tabs and Spaces Configuration {{{

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.shiftround = true
vim.o.expandtab = true

-- }}}

-- Folding Configuration {{{

vim.o.foldmethod = "marker"
vim.cmd("highlight Folded guibg = " .. 235)

-- }}}

-- Keybindings Configuration {{{

vim.g.mapleader = " "

-- Go to Normal mode without ESC key
vim.api.nvim_set_keymap("i", "<Leader>nn", "<Esc>", {noremap=true})
vim.api.nvim_set_keymap("x", "<Leader>nn", "<Esc>", {noremap=true})
-- Navigation between buffers
vim.api.nvim_set_keymap("n", "<Leader>bb", ":buffers<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<Leader>bp", ":bprevious<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<Leader>bn", ":bnext<CR>", {noremap=true, silent=true})
-- Navigation between tabs
vim.api.nvim_set_keymap("n", "<Leader>tp", ":tabprevious<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<Leader>tn", ":tabnext<CR>", {noremap=true, silent=true})
-- Navigation between split panes
vim.api.nvim_set_keymap("n", "<Leader>wh", ":wincmd h<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<Leader>wj", ":wincmd j<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<Leader>wk", ":wincmd k<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<Leader>wl", ":wincmd l<CR>", {noremap=true, silent=true})
-- File save and quit options
vim.api.nvim_set_keymap("n", "<Leader>ww", ":w<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<Leader>wq", ":x<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<Leader>qq", ":q!<CR>", {noremap=true, silent=true})
-- Open a terminal
vim.api.nvim_set_keymap("n", "<Leader>term", ":split | terminal<CR>", {noremap=true, silent=true})
-- Move through filesystem
vim.api.nvim_set_keymap("n", "<C-h>", ":cd ..<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<C-t>", ":cd /<CR>", {noremap=true, silent=true})

-- }}}

-- Utilities Configuration {{{

vim.o.mouse = "a"
vim.o.confirm = true
vim.o.encoding = "UTF-8"
vim.o.clipboard = "unnamedplus"
vim.o.splitbelow = true

-- }}}

-- External LUA config dependencies {{{

-- Colorscheme
vim.cmd("colorscheme EvesNight")

-- Plugins
require("minimap-conf")
require("nvimtree-conf")
require("dashboard-conf")
require("colorizer-conf")
require("gitsigns-conf")

-- Modules
require("modules.statusline")

-- }}}

-- Autorun configurations {{{

vim.api.nvim_exec([[
    augroup AutoConfig
    au!
    au TermOpen * setlocal nonumber norelativenumber
    augroup END
]], false)

-- }}}
