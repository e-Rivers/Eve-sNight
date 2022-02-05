<p align="center">
  <img width="25%" src="https://lh3.googleusercontent.com/pw/AM-JKLXc3sjD7bFQFvs8HP-d6i5p2MaqVIft4d_vRww0yHc2T7LaKCJWVWe8tJMQaJq5WPSE7QYjkeDuDpC5vSzqN-e7fNgd-tNOfvjhhxdnTZx51jMJsDBgtJwWU8n5nO5VvY1MxIUrGy0D5CQnVFaAEy6T=s600-no?authuser=0" />
</p>

<div align="center">
  <h1>Eve's Night OS</h1>
  <i>Emilio Rivers' Linux dotfiles and LightDM configuration</i>
</div>

<br/>
<p align="center">
<a href="#setup"><img width="150px" style="padding: 0 10px;" src=".assets/setup.png"></a>
<a href="https://github.com/elenapan/dotfiles/wiki"><img width="150px" style="padding: 0 10px;" src=".assets/wiki.png"></a>
<a href="https://github.com/elenapan/dotfiles/wiki/Gallery"><img width="150px" style="padding: 0 10px;" src=".assets/gallery.png"></a>
<a href="#tipjar"><img width="150px" style="padding: 0 10px;" src=".assets/tipjar.png"></a>
</p>

<br />
This is not really an Operating System, but you already knew that... These are my personal dotfiles for the Awesome Window Manager, Light Display Manager, Kitty Terminal Emulator and much more stuff to rice Arch Linux. Feel free to take whatever you need and like, 

## S P E C S

<img src="https://raw.githubusercontent.com/wiki/elenapan/dotfiles/assets/amarena.png" alt="img" align="right" width="400px">

+ **Window Manager**: AwesomeWM
+ **Linux Distro**: I use Arch, BTW
+ **Shell**: zsh
+ **Terminal**: kitty
+ **Text Editor**: Neovim
+ **Display Manager**: LightDM
+ **File Manager**: Thunar
+ **Launcher**: rofi
+ **Browser**: Brave (with NightTab extension)

## F E A T U R E S

- Dashboard with useful utilities (weather forecast, night light, upgrades information)
- Cool layouts such as deck and centered layout (Thanks to <a href="https://github.com/BlingCorp/bling">Bling</a> project)
- LightDM theme with support for profile pictures and multiple sessions
- Rofi wifi menu (doesn't work on complex connections, such as WPA2 Enterprise)

## D E P E N D E N C I E S
| Package | Why is it needed? |
| --- | --- |
| `awesome-git` | Well, its the graphical session the user will be logged in into, <i>ergo</i>, is the base of the system and it's awesome |
| `rofi` | Used as application launcher, wifi menu, calculator, powermenu, etc |
| `lightdm`  <br/>`light-locker`<br/> `lightdm-webkit2-greeter` | Display manager and lock screen (optional if you use another one) |
| `pulseaudio` | Audio input and output management, you could use other one like <i>amixer</i> but you would have to reconfigure the dotfiles |
| `networkmanager` | Network management, you could use other one like <i>netctl</i> but you would have to reconfigure the dotfiles |
| `VictorMono Nerd Font` | Font used by all apps (I personally like it because it makes italics look cursive). Again, you can use other one but you'll have to reconfigure the dotfiles |

## I N S T A L L A T I O N

Here are the instructions you should follow to replicate my AwesomeWM setup.

1. Install the [git version of AwesomeWM](https://github.com/awesomeWM/awesome/).

   **Arch users** can use the [awesome-git AUR package](https://aur.archlinux.org/packages/awesome-git/).
   ```shell
   yay -S awesome-git
   ```

   **For other distros**, build instructions are [here](https://github.com/awesomeWM/awesome/#building-and-installation).

2. Install dependencies and enable services

   *If you are curious, [click here](https://github.com/elenapan/dotfiles/wiki/Detailed-dependency-table) to see a table of dependencies and why they are needed.*

   + Software

     - **Ubuntu** 18.04 or newer (and all Ubuntu-based distributions)

         ```shell
         sudo apt install rofi lm-sensors acpid jq fortune-mod redshift mpd mpc maim feh pulseaudio inotify-tools xdotool

         # Install light, which is not in the official Ubuntu repositories
         wget https://github.com/haikarainen/light/releases/download/v1.2/light_1.2_amd64.deb
         sudo dpkg -i light_1.2_amd64.deb
         ```

     - **Arch Linux** (and all Arch-based distributions)

         *Assuming your AUR helper is* `yay`

         ```shell
         yay -S rofi lm_sensors acpid jq fortune-mod redshift mpd mpc maim feh light-git pulseaudio inotify-tools xdotool
         ```
   + Services

      ```shell
      # For automatically launching mpd on login
      systemctl --user enable mpd.service
      systemctl --user start mpd.service
      # For charger plug/unplug events (if you have a battery)
      sudo systemctl enable acpid.service
      sudo systemctl start acpid.service
      ```

3. Install needed fonts

   You will need to install a few fonts (mainly icon fonts) in order for text and icons to be rendered properly.

   Necessary fonts:
   + **Typicons** - [github](https://github.com/fontello/typicons.font)
   + **Material Design Icons** - [dropbox](https://www.dropbox.com/s/4fevs095ho7xtf9/material-design-icons.ttf?dl=0)
   + **Icomoon** - [dropbox](https://www.dropbox.com/s/hrkub2yo9iapljz/icomoon.zip?dl=0)
   + **Nerd Fonts** - [website](https://www.nerdfonts.com/font-downloads)
      (You only need to pick and download one Nerd Font. They all include the same icons)
   + **Scriptina** - [website](https://www.dafont.com/scriptina.font) - Handwritten font used in the lock screen

   Optional fonts:
   + **My custom Iosevka build** - [dropbox](https://www.dropbox.com/s/nqyurzy8wcupkkz/myosevka.zip?dl=0) - 💙 *my favorite monospace font*
   + **Anka/Coder**
   + **Google Sans** - 💙 *my favorite sans font*
   + **Roboto Condensed**
   + **San Francisco Display**

   Once you download them and unpack them, place them into `~/.fonts` or `~/.local/share/fonts`.
   - You will need to create the directory if it does not exist.
   - It does not matter that the actual font files (`.ttf`) are deep inside multiple directories. They will be detected as long as they can be accessed from `~/.fonts` or `~/.local/share/fonts`.

   You can find the fonts required inside the `misc/fonts` folder of the repository.
   ```shell
   cp -r ./misc/fonts/* ~/.fonts/
   # Or to ~/.local/share/fonts
   cp -r ./misc/fonts/* ~/.local/share/fonts/
   ```
   Finally, run the following in order for your system to detect the newly installed fonts.
   ```shell
   fc-cache -v
   ```

4. Install my AwesomeWM configuration files

   ```shell
   git clone https://github.com/elenapan/dotfiles
   cd dotfiles
   [ -e ~/.config/awesome ] && mv ~/.config/awesome ~/.config/awesome-backup-"$(date +%Y.%m.%d-%H.%M.%S)" # Backup current configuration
   cp -r config/awesome ~/.config/awesome
   ```

4. Configure stuff

   The relevant files are inside your `~/.config/awesome` directory.

   + User preferences and default applications

      In `rc.lua` there is a *User variables and preferences* section where user preferences and default applications are defined.
      You should change those to your liking. Probably the most important change you can make is to set your `terminal`.

      For more sophisticated control over your apps, check out `apps.lua`

      Note: For the weather widgets to work, you will also need to create an account on [openweathermap](https://openweathermap.org), get your key, look for your city ID, and set `openweathermap_key` and `openweathermap_city_id` accordingly.

   + Have a general idea of what my keybinds do

      My keybinds will most probably not suit you completely, but on your first login you might need to know how to navigate the desktop.

      See the [keybinds](#keybinds) section for more details.

      You can edit `keys.lua` to configure your keybinds.

   + *(Optional)* This is also a good time to take a look at [how my configuration is structured](#awesomewm-configuration-file-structure) in order to understand the purpose of each file.

5. Login with AwesomeWM 🎉

   Congratulations, at this point you should be ready to log out of your current desktop and into AwesomeWM.

   Your login screen should have a button that lets you change between available desktop sessions. If not, [click here](https://github.com/elenapan/dotfiles/wiki/Troubleshooting#i-cannot-find-the-login-screen-button-that-lets-me-login-with-awesomewm) to find out how to fix it.

   Try it, play with it, enjoy it.
   Consider checking out the [Advanced setup](https://github.com/elenapan/dotfiles/wiki/Advanced-setup) in order to enable and configure various components that are not needed to use the desktop, but provide a better experience.


6. *(Optional)* Eye-candy

   + Set the wallpaper

      ```shell
      feh --bg-fill /path/to/your/wallpaper
      ```

   + Load a colorscheme

      ```shell
      xrdb -merge /path/to/colorscheme
      ```

      Notes:
      - To see the new colors you should restart AwesomeWM with <kbd>super+shift+r</kbd> or by right-clicking the desktop and clicking the gear icon (bottom-right).
      - In the [.xfiles](.xfiles) directory of the repository I provide you with a few of my own colorschemes, but you can also use your favorite one.
      - All of my AwesomeWM themes take their colors from `xrdb`. This also means that they play nice with tools like [pywal](https://github.com/dylanaraps/pywal).


## AwesomeWM configuration: File structure

After setting up my AwesomeWM configuration, inside `~/.config/awesome` you will find the following:

+ 🔧 `rc.lua`

   The main configuration file which binds everything together.

   This file allows you to set user preferences, choose themes, configure default layouts for each tag, window rules and more.
   It is also responsible for initializing all necessary desktop components.

+ ⌨️ `keys.lua`

   It initializes global and client keybinds.
   In addition, it defines what mouse clicks do on windows, window titlebars or the desktop.

+ 🎮 `apps.lua`

   Provides functions for *activating* various applications, meaning either spawning them, focusing them or toggling them depending on whether they are currently running or not.

+ 📚 `helpers.lua`

   Provides various uncategorized helper functions to make our life easier and our code cleaner.

+ 🎨 `themes` directory

   Here you can find a directory for each available theme.

   Such a directory should include at least a `theme.lua` and optionally icons, wallpaper, and whatever asset you need that is theme-specific.
   The `theme.lua` file usually sets colors, sizes and positions of various elements.

+ 🖼 `icons` directory

   Here you can find a directory for each available icon theme and an `init.lua` file which initializes the `icons` variables.

   Icons can be images taken from the selected icon theme or text symbols taken from some icon font.

   For example, `icons.image.firefox` can be used to refer to your selected theme's Firefox icon instead of using the full path to the image. This makes it easy to switch between themes.

   Note: Icon themes defined here have nothing to do with your system-wide icon theme.

+ 🎀 `decorations` directory

   In this directory you can find window decoration (titlebar) styles.

   They affect the layout of the titlebar and the titlebar buttons (e.g. close, maximize, minimize).

   Optionally, they may implement more complex decorations, using multiple titlebars around the window to create a certain look (e.g. double borders) or achieve anti-aliased window corners.

   Finally, some clients may have their own special titlebars added to them in order to simulate a custom UI.
   For now, a custom `mpd` UI has been implemented.

   The `decorations` module also includes helper functions that generate titlebar buttons, in case you do not have/want image buttons.

+ 💎 `elemental` directory

   Contains desktop components or *elements* such as bars, sidebars, lock screens and more.
   Elements with multiple available themes have their own directory. For example:

   + In `elemental/bar` you can find a `.lua` file for each available bar or bar group.

      Multiple bars can be created in one file.
      Every bar theme provides the global functions `wibars_toggle()` and `tray_toggle()` which you can bind to any keys you want.

   + In `elemental/sidebar` you can find a `.lua` file for each available sidebar theme.

   + ... And so on.

+ 💬 `notifications` directory

   This directory includes notification daemons that trigger notifications for various desktop events such as volume or brightness change.
   Also it includes notification themes that define the layout of the notification contents.

+ 🍜 `noodle` directory: Contains widgets that usually take up more than 50 lines of code.

   Widgets display information in visual form (text, images, progress bars).
   Without them, all desktop elements would just be empty boxes.
   They are used by the desktop components defined inside the `elemental` directory.
   Widgets can be defined in any file but I prefer to separate a big widget (with a lot of logic) from the element I am using it in.

+ 😈 `evil` directory

   Contains daemons (processes that run in the background) which emit system info.

   They provide an easy way of writing widgets that rely on external information. All you need to do is subscribe to the signal a daemon provides.
   No need to remember which shell command gives you the necessary info or bother about killing orphan processes. Evil takes care of everything.

## S C R E E N S H O T S

