#!/bin/sh

if [ "$1" = "install" -a "$#" = 1 ]; then
    git clone https://github.com/glepnir/dashboard-nvim;
    git clone https://github.com/lewis6991/gitsigns.nvim;
    git clone https://github.com/wfxr/minimap.vim;
    git clone https://github.com/norcalli/nvim-colorizer.lua;
    git clone https://github.com/kyazdani42/nvim-tree.lua;
    git clone https://github.com/kyazdani42/nvim-web-devicons;
    git clone https://github.com/nvim-lua/plenary.nvim;
    git clone https://github.com/nvim-telescope/telescope.nvim;
elif [ "$1" = "update" -a "$#" = 1 ]; then
    cd dashboard-nvim && git pull && cd ..;
    cd gitsigns.nvim && git pull && cd ..;
    cd minimap.vim && git pull && cd ..;
    cd nvim-colorizer.lua && git pull && cd ..;
    cd nvim-tree.lua && git pull && cd ..;
    cd nvim-web-devicons && git pull && cd ..;
    cd plenary.nvim && git pull && cd ..;
    cd telescope.nvim && git pull && cd ..;
elif [ "$1" = "update" -a "$#" = 2 ]; then
    if [ "$2" = "dashboard" ]; then
        cd dashboard-nvim && git pull && cd ..;
    elif [ "$2" = "gitsigns" ]; then
        cd gitsigns.nvim && git pull && cd ..;
    elif [ "$2" = "minimap" ]; then
        cd minimap.vim && git pull && cd ..;
    elif [ "$2" = "colorizer" ]; then
        cd nvim-colorizer.lua && git pull && cd ..;
    elif [ "$2" = "nvimtree" ]; then
        cd nvim-tree.lua && git pull && cd ..;
    elif [ "$2" = "devicons" ]; then
        cd nvim-web-devicons && git pull && cd ..;
    elif [ "$2" = "plenary" ]; then
        cd plenary.nvim && git pull && cd ..;
    elif [ "$2" = "telescope" ]; then
        cd telescope.nvim && git pull && cd ..;
    fi
else
    echo -e "\nInvalid option, use the program as follows:\n"
    echo -e "● \e[1m\e[4minstall:\e[0m will clone the necessary repos"
    echo -e "● \e[1m\e[4mupdate:\e[0m will update (pull) all the repos of the installed plugins"
    echo -e "● \e[1m\e[4mupdate <plugin>:\e[0m will update (pull) only the specified repo\n"
fi
