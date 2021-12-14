--   vim:fileencoding=utf-8:foldmethod=marker
--
--   Dashboard Plugin Configuration dependency for Neovim Config File
--
--   Author: Emilio Rivers (e-Rivers)


-- Configuration {{{

vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_footer = {
            "",
            "Programming today is a race between software engineers striving to build", 
            "bigger and better idiot-proof programs, and the Universe trying to produce",
            "bigger and better idiots. So far, the Universe is winning.",
            "",
            "- Rick Cook"}

vim.g.dashboard_custom_section = {
             ["book_marks"] = {
                 ["description"] = {" Jump to bookmarks                         SPC f b"},
                 ["command"] = ":DashboardJumpMark"},
             ["find_file"] = {
                 ["description"] = {" Find file                                 SPC f f"},
                 ["command"] = ":DashboardFindFile"},
             ["find_history"] = {
                 ["description"] = {" Recently opened files                     SPC f h"},
                 ["command"] = ":DashboardFindHistory"},
             ["find_word"] = {
                 ["description"] = {" Find word                                 SPC w f"},
                 ["command"] = ":DashboardFindWord"},
             ["new_file"] = {
                 ["description"] = {" New file                                  SPC f n"},
                 ["command"] = ":DashboardNewFile"},
             ["last_session"] = {
                 ["description"] = {"勒Open last session                         SPC s l"},
                 ["command"] = ":SessionLoad"},
             ["quit_editor"] = {
                 ["description"] = {" Quit Neovim                               SPC e c"},
                 ["command"] = ":q" }
             }

vim.g.dashboard_custom_header = {
    "",
     "                             ⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⢀⣀⣠⣤⣤⣴⣦⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                            ",
     "                             ⠀⠀⠀⠀⠀⠀  ⢀⣤⣾⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀                            ",
     "                             ⠀⠀⠀⠀  ⣠⣾⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣶⡀⠀⠀⠀⠀                            ",
     "                             ⠀⠀  ⠀⣴⣿⣿⠟⠁⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀                            ",
     " ████     ██                    ⠀⣼⣿⣿⠋⠀⠀⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀⠀   ██      ██               ",
     "░██░██   ░██                   ⠀⢸⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡇⠀  ░██     ░██               ",
     "░██░░██  ░██  ██████   █████   ⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀  ░██     ░██ ██ ██████████ ",
     "░██ ░░██ ░██ ██░░░░  ██░░░░██  ⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⠀  ░░██    ██ ░██░░██░░██░░██",
     "░██  ░░██░██░███████░██   ░██  ⠀⣿⣿⣷⠀⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀   ░░██  ██  ░██ ░██ ░██ ░██",
     "░██   ░░████░██░░░░ ░██   ░██  ⠀⢸⣿⣿⡆⠀⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀⣰⣿⣿⠇⠀    ░░████   ░██ ░██ ░░  ░██",
     "░██    ░░███░░██████░░██████   ⠀⠀⢻⣿⣿⣄⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀⣰⣿⣿⡟⠀⠀     ░░██    ░██ ███     ░██",
     "░░      ░░░  ░░░░░░  ░░░░░░    ⠀⠀⠀⠻⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⠀⠀⠀      ░░     ░░ ░░░      ░░ ",
     "                             ⠀⠀⠀⠀  ⠈⠻⣿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀                            ",
     "                             ⠀⠀⠀⠀⠀⠀  ⠈⠛⠿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀                            ",
     "                             ⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠉⠉⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                            "}

-- }}}

-- Keybindings {{{

vim.api.nvim_set_keymap("n", "<Leader>sl", ":<C-u>SessionLoad<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>ss", ":<C-u>SessionSave<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>fb", ":DashboardJumpMark<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<Leader>ff", ":DashboardFindFile<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<Leader>fh", ":DashboardFindHistory<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<Leader>wf", ":DashboardFindWord<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<Leader>fn", ":DashboardNewFile<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<Leader>ec", ":q<CR>", {noremap=true, silent=true})

-- }}}
