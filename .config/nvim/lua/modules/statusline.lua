--     vim:fileencoding=utf-8:foldmethod=marker
--
--     Custom Statusline Module for Neovim Config File
--
--     Author: Emilio Rivers (e-Rivers)

local Statusline = {}

-- Separators
Statusline.separators = { "▍▌▊▊██", "██🮉🮉🮉🮈🮈🮈🮇🮇" }

-- Highlight groups
Statusline.colors = {
    normal          = "%#NormalMode#",
    insert          = "%#InsertMode#",
    replace         = "%#ReplaceMode#",
    visual          = "%#VisualMode#",
    command         = "%#CommandMode#",
    confirm         = "%#ConfirmMode#",
    terminal        = "%#TerminalMode#",
    unknown         = "%#UnknownMode#",
    normal_sep      = "%#NormalModeSep#",
    insert_sep      = "%#InsertModeSep#",
    replace_sep     = "%#ReplaceModeSep#",
    visual_sep      = "%#VisualModeSep#",
    command_sep     = "%#CommandModeSep#",
    confirm_sep     = "%#ConfirmModeSep#",
    terminal_sep    = "%#TerminalModeSep#",
    unknown_sep     = "%#UnknownModeSep#",
    statusline      = "%#StatusLine#",
    statuslinenc    = "%#StatusLineNC#",
    git             = "%#Git#",
    filename_alt    = "%#FilenameAlt#",
    filename        = "%#Filename#",
    filetype        = "%#Filetype#",
    filetype_alt    = "%#FiletypeAlt#",
    line_col        = "%#LineCol#",
    line_col_alt    = "%#LineColAlt#",
    perbar_icon     = "%#PerPosIcon#"
}

-- Definition of the width at which each section will be truncated
Statusline.trunc_width = setmetatable({
    mode        = 80,
    git_status  = 90,
    filename    = 140,
    line_col    = 80,
}, {
    __index = function()
        return 80
    end
})

-- Method to determine when to truncate a certain section
Statusline.is_truncated = function(_, width)
    local current_width = vim.api.nvim_win_get_width(0)
    return current_width < width
end

-- Modes That will be handled
Statusline.modes = setmetatable({
    [110]   = {"Normal", "N"};
    [118]   = {"Visual", "V" };
    [86]    = {"V·Line", "V·L" };
    [22]    = {"V·Block", "V·B"};
    [105]   = {"Insert", "I"};
    [82]    = {"Replace", "R"};
    [99]    = {"Command", "C"};
    [114]   = {"Confirm", "C"};
    [116]   = {"Terminal", "T"};
}, {
    __index = function()
        return {"Unknown", "U"} -- handle edge cases
    end
})

-- Set the current mode name in the corresponding section
Statusline.get_current_mode = function(self)
    local current_mode = vim.api.nvim_get_mode().mode:byte()

    if self:is_truncated(self.trunc_width.mode) then
        return string.format(" %s ", self.modes[current_mode][2]):upper()
    end
    return string.format(" %s ", self.modes[current_mode][1]):upper()
end

-- Method to get the color of the vim mode section of the bar
Statusline.get_mode_color = function(self)
    local current_mode = vim.api.nvim_get_mode().mode:byte()

    if current_mode == 110 then
        return {self.colors.normal, self.colors.normal_sep}
    elseif current_mode == 118 or current_mode == 86 or current_mode == 22 then
        return {self.colors.visual, self.colors.visual_sep}
    elseif current_mode == 105 then
        return {self.colors.insert, self.colors.insert_sep}
    elseif current_mode == 82 then
        return {self.colors.replace, self.colors.replace_sep}
    elseif current_mode == 99 then
        return {self.colors.command, self.colors.command_sep}
    elseif current_mode == 114 then
        return {self.colors.confirm, self.colors.confirm_sep}
    elseif current_mode == 116 then
        return {self.colors.terminal, self.colors.terminal_sep}
    end
    return {self.colors.unknown, self.colors.unknown_sep}
end

-- Method to display the section of Git status
Statusline.get_git_status = function(self)
    -- Use fallback because it doesn"t set this variable on the initial `BufEnter`
    local signs = vim.b.gitsigns_status_dict or {head = "", added = 0, changed = 0, removed = 0}
    local is_head_empty = signs.head ~= ""

    if self:is_truncated(self.trunc_width.git_status) then
        return is_head_empty and string.format("  %s ", signs.head or "") or ""
    end

    return is_head_empty and string.format(
        " +%s ~%s -%s |  %s ",
        signs.added, signs.changed, signs.removed, signs.head
    ) or ""
end

-- Filename Section's Method
Statusline.get_filename = function(self)
    if self:is_truncated(self.trunc_width.filename) then return " %<%f " end
    return " %<%F "
end

-- Filetype Section's Method
Statusline.get_filetype = function()
    local file_name, file_ext = vim.fn.expand("%:t"), vim.fn.expand("%:e")
    local icon = require"nvim-web-devicons".get_icon(file_name, file_ext, { default = true })
    local filetype = vim.bo.filetype

    if filetype == "" then return "" end
    return string.format(" %s %s ", icon, filetype):lower()
end

-- Method that will display cursor's current position and a fancy bar with the position in the file (like a micro map)
Statusline.get_line_col = function(self)
    if self:is_truncated(self.trunc_width.line_col) then return " %l:%c:%p%% " end
    local perPos = math.floor((vim.api.nvim_win_get_cursor(0)[1]*100)/vim.api.nvim_buf_line_count(0))
    if perPos < 14 then
        return "Ln %l, Col %c [ "..self.colors.perbar_icon.."▁"..self.colors.line_col.." %p%%]"
    elseif perPos < 26 then
        return "Ln %l, Col %c [ "..self.colors.perbar_icon.."▂"..self.colors.line_col.." %p%%]"
    elseif perPos < 38 then
        return "Ln %l, Col %c [ "..self.colors.perbar_icon.."▃"..self.colors.line_col.." %p%%]"
    elseif perPos < 51 then
        return "Ln %l, Col %c [ "..self.colors.perbar_icon.."▄"..self.colors.line_col.." %p%%]"
    elseif perPos < 63 then
        return "Ln %l, Col %c [ "..self.colors.perbar_icon.."▅"..self.colors.line_col.." %p%%]"
    elseif perPos < 76 then
        return "Ln %l, Col %c [ "..self.colors.perbar_icon.."▆"..self.colors.line_col.." %p%%]"
    elseif perPos < 90 then
        return "Ln %l, Col %c [ "..self.colors.perbar_icon.."▇"..self.colors.line_col.." %p%%]"
    else
        return "Ln %l, Col %c [ "..self.colors.perbar_icon.."█"..self.colors.line_col.." %p%%]"
    end
end

-- Method to display the statusbar in "normal conditions"
Statusline.set_active = function(self)
    local colors = self.colors

    local mode = self:get_mode_color()[1] .. self:get_current_mode()
    local mode_alt = self:get_mode_color()[2] .. self.separators[2]
    local git = colors.git .. self:get_git_status()
    local filename_alt = colors.filename_alt .. self.separators[1]
    local filename = colors.filename .. self:get_filename()
    local filetype_alt = colors.filetype_alt .. self.separators[1]
    local filetype = colors.filetype .. self:get_filetype()
    local line_col_alt = colors.line_col_alt .. self.separators[1]
    local line_col = colors.line_col .. self:get_line_col()

    return table.concat({
        mode, mode_alt, "%=", git, filename_alt, filename, filetype_alt, filetype, line_col_alt, line_col
    })
end

-- Method to display just the empty bar background on an inactive buffer
Statusline.set_inactive = function(self)
    return self.colors.statuslinenc
end

-- Method to display nothing (used in Dashboard)
Statusline.set_disabled = function(self)
    return "%#Normal#"
end

-- Method to display a special statusline for NvimTree Buffer
Statusline.set_explorer = function(self)
    local title = self:get_mode_color()[1] .. "   "
    local title_alt = self:get_mode_color()[2] .. self.separators[2]

    return table.concat({ self.colors.git, title, title_alt })
end

-- Function to display the corresponding type of statusline
DisplayStatusline = setmetatable(Statusline, {
    __call = function(statusline, mode)
        if mode == "active" then return statusline:set_active() end
        if mode == "inactive" then return statusline:set_inactive() end
        if mode == "explorer" then return statusline:set_explorer() end
        if mode == "disabled" then return statusline:set_disabled() end
    end
})

-- set statusline
vim.api.nvim_exec([[
    augroup DisplayStatusline
    au!
    au WinEnter,BufEnter * setlocal statusline=%!v:lua.DisplayStatusline('active')
    au WinLeave,BufLeave * setlocal statusline=%!v:lua.DisplayStatusline('inactive')
    au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.DisplayStatusline('explorer')
    au FileType dashboard setlocal statusline=%!v:lua.DisplayStatusline('disabled')
    augroup END
]], false)

