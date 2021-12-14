--   vim:fileencoding=utf-8:foldmethod=marker
--
--   Neovim Eve'sNight Theme Colorscheme Configuration file
--
--   Author: Emilio Rivers (e-Rivers)


-- Initial Configurations {{{

-- Reset existing highlight!s and syntax
vim.cmd("highlight! clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

-- Set appropriate background
vim.o.background = "dark"

-- Name of the colorscheme
vim.g.colors_name = "EvesNight"

-- }}}

-- Color Variable Declaration {{{

local backOne = "#020B1E"
local backTwo = "#000410"
local black = "#000000"
local white = "#FFFFFF"
local col_1D = "#404A63"
local col_1L = "#505A73"
local col_2D = "#1F68BB"
local col_2L = "#2F78CB"
local col_3D = "#1CADA1"
local col_3L = "#2CBDB1"
local col_4D = "#1A9E30"
local col_4L = "#2AAE40"
local col_5D = "#5DC400"
local col_5L = "#6DD410"
local col_6D = "#91EA10"
local col_6L = "#B1FB30"
local col_1X = "#FFFB00"
local col_2X = "#8275F1"
local col_3X = "#00FF00"
local col_4X = "#303749"

-- }}}

-- Initial customization {{{

vim.cmd("highlight! VertSplit gui=NONE guibg=NONE")

vim.o.number = true

vim.o.cursorline = true
vim.cmd("highlight! CursorLine gui=NONE guibg=NONE")
vim.cmd("highlight! CursorLineNr gui=italic,bold guibg="..col_2L.." guifg="..black)
vim.cmd("highlight! LineNr guifg="..col_1L)

vim.opt.fillchars = { eob = " " }

vim.o.termguicolors = true

--- }}}

-- Editor Background {{{

vim.cmd("highlight! Normal guibg="..backOne.." guifg="..white)
vim.cmd("highlight! VertSplit guibg="..backTwo.." guifg="..backTwo)
vim.cmd("highlight! Split guibg="..backTwo.." guifg="..backTwo)
vim.cmd("highlight! EndOfBuffer guibg="..backOne.." guifg="..white)
vim.cmd("highlight! NvimTreeNormal guibg="..backTwo.." guifg="..white)
vim.cmd("highlight! NvimTreeEndOfBuffer guibg="..backTwo.." guifg="..white)
-- }}}

-- Tabs {{{

vim.cmd("highlight! Title guifg="..col_2L)
vim.cmd("highlight! TabLine gui=none guibg="..backTwo.." guifg="..white)
vim.cmd("highlight! TabLineSel gui=bold,italic guibg="..col_2L.." guifg="..black)
vim.cmd("highlight! TabLineFill guibg="..backTwo.." guifg="..backTwo)

-- }}}

-- Folding & visual highlight {{{

vim.cmd("highlight! Folded guibg="..backTwo.." guifg="..col_5L)
vim.cmd("highlight! Visual guibg="..col_3L.." guifg="..black)
vim.cmd("highlight! FoldColumn guibg="..backTwo.." guifg="..col_5L)

-- }}}

-- Pmenu (the menu open when pressing tab on command mode) {{{

vim.cmd("highlight! Pmenu guibg="..backTwo.." guifg="..col_6L)
vim.cmd("highlight! PmenuSel guibg="..col_4D.." guifg="..white)
vim.cmd("highlight! PmenuSbar guibg="..backTwo.." guifg="..white)
vim.cmd("highlight! PmenuThumb guibg="..col_2L.." guifg="..white)

-- }}}

-- Datatypes {{{

vim.cmd("highlight! Constant guifg="..col_5L)
vim.cmd("highlight! Number guifg="..col_3L)
vim.cmd("highlight! Statement gui=italic guifg="..col_2L)
vim.cmd("highlight! Comment gui=italic guifg="..col_1L)
vim.cmd("highlight! Special gui=bold guifg="..col_1X)
vim.cmd("highlight! PreProc gui=bold guifg="..col_2X)

-- }}}

-- Errors {{{

vim.cmd("highlight! NvimInternalError guibg="..col_6L.." guifg="..col_6L)
vim.cmd("highlight! Error gui=bold guibg="..col_6L.." guifg="..black)
vim.cmd("highlight! ErrorMsg gui=bold guibg="..col_6L.." guifg="..black)

-- }}}

-- Statusline {{{

vim.cmd("highlight! StatusLine guibg="..backTwo.." guifg="..backTwo)
vim.cmd("highlight! StatusLineNC guibg="..backTwo.." guifg="..backTwo)
vim.cmd("highlight! NormalMode gui=bold guibg="..col_2L.." guifg="..black)
vim.cmd("highlight! InsertMode gui=bold guibg="..col_4D.." guifg="..black)
vim.cmd("highlight! ReplaceMode gui=bold guibg="..col_6L.." guifg="..black)
vim.cmd("highlight! VisualMode gui=bold guibg="..col_3L.." guifg="..black)
vim.cmd("highlight! CommandMode gui=bold guibg="..col_2X.." guifg="..black)
vim.cmd("highlight! TerminalMode gui=bold guibg="..white.." guifg="..black)
vim.cmd("highlight! ConfirmMode gui=bold guibg="..col_1X.." guifg="..black)
vim.cmd("highlight! UnknownMode gui=bold guibg="..black.." guifg="..white)
vim.cmd("highlight! NormalModeSep guibg="..backTwo.." guifg="..col_2L)
vim.cmd("highlight! InsertModeSep guibg="..backTwo.." guifg="..col_4D)
vim.cmd("highlight! ReplaceModeSep guibg="..backTwo.." guifg="..col_6L)
vim.cmd("highlight! VisualModeSep guibg="..backTwo.." guifg="..col_3L)
vim.cmd("highlight! CommandModeSep guibg="..backTwo.." guifg="..col_2X)
vim.cmd("highlight! TerminalModeSep guibg="..backTwo.." guifg="..white)
vim.cmd("highlight! ConfirmModeSep guibg="..backTwo.." guifg="..col_1X)
vim.cmd("highlight! UnknownModeSep guibg="..backTwo.." guifg="..black)
vim.cmd("highlight! Filename gui=bold guibg="..col_2L.." guifg="..black)
vim.cmd("highlight! FilenameAlt guibg="..backTwo.." guifg="..col_2L)
vim.cmd("highlight! Filetype gui=bold guibg="..col_5L.." guifg="..black)
vim.cmd("highlight! FiletypeAlt guibg="..col_2L.." guifg="..col_5L)
vim.cmd("highlight! LineCol gui=bold guibg="..black.." guifg="..white)
vim.cmd("highlight! LineColAlt guibg="..col_5L.." guifg="..black)
vim.cmd("highlight! Git guibg="..backTwo.." guifg="..white)
vim.cmd("highlight! PerPosIcon guibg="..black.." guifg="..col_5L)

-- }}}

-- GitSigns {{{

vim.cmd("highlight! SignColumn gui=bold guibg="..backOne.." guifg="..backOne)
vim.cmd("highlight! GitSignsChange gui=bold guibg="..backOne.." guifg="..col_6L)
vim.cmd("highlight! GitSignsAdd gui=bold guibg="..backOne.." guifg="..col_4D)
vim.cmd("highlight! GitSignsDelete gui=bold guibg="..backOne.." guifg="..black)

-- }}}

-- Minimap {{{

vim.cmd("highlight! NormalMinimap guibg="..backOne.." guifg="..white)
vim.cmd("highlight! CursorMinimap gui=bold guibg="..col_4X.." guifg="..col_3X)
vim.cmd("highlight! RangeMinimap gui=bold guibg="..col_4X.." guifg="..white)

-- }}}

-- Nvim Tree {{{

vim.cmd("highlight! NvimTreeRootFolder gui=bold guifg="..col_5D)
vim.cmd("highlight! Directory gui=bold guifg="..col_2L)
vim.cmd("highlight! NvimTreeImageFile gui=bold guifg="..col_2X)

--- }}}


