<p align="center">
  <img width="25%" src="https://lh3.googleusercontent.com/pw/AM-JKLXc3sjD7bFQFvs8HP-d6i5p2MaqVIft4d_vRww0yHc2T7LaKCJWVWe8tJMQaJq5WPSE7QYjkeDuDpC5vSzqN-e7fNgd-tNOfvjhhxdnTZx51jMJsDBgtJwWU8n5nO5VvY1MxIUrGy0D5CQnVFaAEy6T=s600-no?authuser=0" />
</p>

<div align="center">
  <h1>Eve's Night OS</h1>
  <i>Emilio Rivers' Linux dotfiles and LightDM configuration</i>
</div>

<br/>
<p align="center">
<a href="https://github.com/e-Rivers/Eve-sNight#d-e-p-e-n-d-e-n-c-i-e-s"><img width="150px" style="padding: 0 10px;" src="https://lh3.googleusercontent.com/pw/AM-JKLWyv_6jHczB8Op9L5YJwOWskpEQjUE8oiZGtoXpp_-M7CWZBLkBsXrtLiOQ6_welZ47koujI_-c-ETLlJjipy8NgmmxZPeVVQponAYmpLheGxeqHjsbbGQhwiA06oHicstVtYPkWmXz9Y2Wd5Y9Jz-U=w750-h250-no?authuser=0"></a>
<a href="https://github.com/e-Rivers/Eve-sNight#i-n-s-t-a-l-l-a-t-i-o-n-n-s-e-t-u-p"><img width="150px" style="padding: 0 10px;" src="https://lh3.googleusercontent.com/pw/AM-JKLVRJ5sfP0rrQpV-2thXgSkRMDFAj0n58iTrMAtgrNg12jcbj1PrK94xN-qDHvVUIN7oOnwktBSnJ0xPzP7iV5ufZOhZRcnLTz3O8tMQRgR2d3ku_gaR-FR1RrNH9pn6vIVqtLoyvHVRMlAHERIF-Ubp=w750-h250-no?authuser=0"></a>
<a href="https://github.com/e-Rivers/Eve-sNight#d-o-t-f-i-l-e-s-s-t-r-u-c-t-u-r-e"><img width="150px" style="padding: 0 10px;" src="https://lh3.googleusercontent.com/pw/AM-JKLWA-DFZSnkOrX3oJXSvU54XqufdQhzyaw_8nUJrI5v9l9gwzLGMniEYFXAKbxNn1TpO0nXN4YSvgZZdaacXhAtHgQdE9sX7boLj5JwNIGeNEXOFsDDD0r2CCfrx_jaMDF9FaVONPl9U_MwjvCqV60aS=w750-h250-no?authuser=0"></a>
<a href="https://github.com/e-Rivers/Eve-sNight#s-c-r-e-e-n-s-h-o-t-s"><img width="150px" style="padding: 0 10px;" src="https://lh3.googleusercontent.com/pw/AM-JKLVjpryXMg5zbx7wKzxWfmkFHkzimamVrRQC3uBS0T53lGPmf4RYewe_YUO9eKUFqoj_pjsx5XQAxJKFiwPU_WY0nTg324Ad-iKsD1sHo-32ie_UpVO7eXj6S9BYWTjJvsAih4CGFwCEAafcm5-1I3Zb=w750-h250-no?authuser=0"></a>
</p>

<div align='center'>

![maintained](https://img.shields.io/maintenance/yes/2022?logo=checkmarx&logoColor=white&style=for-the-badge) ![contributions](https://img.shields.io/github/last-commit/e-Rivers/Eve-sNight?logo=github&style=for-the-badge) ![HitCount](https://img.shields.io/github/issues-pr/e-Rivers/Eve-sNight?logo=semantic%20web&style=for-the-badge)

</div>

<br />
This is not really an Operating System, but you already knew that... These are my personal dotfiles for the Awesome Window Manager, Light Display Manager, Kitty Terminal Emulator and much more stuff to rice Arch Linux. I riced it so it wasn't only eye-candy, but also functional; nevertheless, there are features you may dislike or rather change (for example, I don't like having the dock or titlebars) so feel free to take whatever you want and adapt it to your needs.

## S P E C S

<img src="https://lh3.googleusercontent.com/pw/AM-JKLUU9qAo97nH8DLgvQ0Dkd1zZYJtOu-dj11nH-5apH7jxpgOV3U23mVTUeC0dfvv8WoVhmNzbcyMIXyBNyNMxTXrNIO12EB_KxSnjMwX51nArMxNffyZLPAQYtcaHwNJRbpBPUnmFVpn_m1qqvm34yIr=w879-h649-no?authuser=0" alt="img" align="right" width="400px">


+ **Linux Distro**: I use Arch, BTW
+ **Window Manager**: AwesomeWM
+ **Shell**: zsh (without OhMyZSH)
+ **Terminal**: kitty
+ **Text Editor**: Neovim
+ **Display Manager**: LightDM
+ **File Manager**: Thunar & ranger
+ **Launcher**: rofi
+ **Browser**: Brave (with NightTab extension)
+ **Agenda App**: SuperProductivity

<br />

## F E A T U R E S

- Dashboard with useful utilities (weather forecast, night light, package upgrades information)
- Cool layouts such as deck and centered layout (Thanks to <a href="https://github.com/BlingCorp/bling">Bling</a> project)
- LightDM theme with support for profile pictures and multiple sessions
- Rofi wifi menu (doesn't work on complex connections, such as WPA2 Enterprise)
- Different wallpapers on each tag (useful to know in which one you are when the dock is hidden)
- Brightness and volume OSD widgets for better visualization

## D E P E N D E N C I E S
| Package or utility | Why is it needed? |
| --- | --- |
| `awesome-git` | Well, its the graphical session the user will be logged in into, <i>ergo</i>, is the base of the system and it's awesome |
| `lightdm`  <br/>`light-locker`<br/> `lightdm-webkit2-greeter` | Display manager and lock screen (optional if you use another one) |
| `pulseaudio` | Audio input and output management (used on dashboard and volume OSD), you could use other one like <i>amixer</i> but you would have to reconfigure the dotfiles |
| `networkmanager` | Network management, you could use other one like <i>netctl</i> but you would have to reconfigure the dotfiles |
| `VictorMono Nerd Font` | Font used by all apps (I personally like it because it makes italics look cursive). Again, you can use other one but you'll have to reconfigure the dotfiles |
| `ranger`<br/> `thunar` | These are the file managers I use, one terminal based and the other GUI |
| `paru` | Helper to install AUR packages, you could use <i>yay</i> or another one but you'll have to reconfigure the package upgrade widget on the dashboard |
| `bat` | Substitute of cat that colorizes and uses a pager by default, used as alias and in dashboard to display the available package upgrades |
| `redshift` | It's the package used to toggle night-light mode on dashboard (I set it to 1500:1500 but change it to your preferences) |
| `upower` | This one is used to get the battery percentage status that is displayed on the dashboard |
| `python-pillow` | This is a dependency to properly visualize images in your terminal from ranger file manager |
| `networkmanager` <br/> `wpa_supplicant` <br/> `wireless_tools` | This ones are used to display to which network you are connected on the dashboard and also are used by the rofi wifi modi, reconfigure if you use another network manager such as <i>netctl</i> |
| `picom` | Compositor to add blur, shadows and transparency to windows, among other features |
| `brightnessctl` | Program used to adjust brightness of the display (used in brightness osd and dashboard), reconfigure the dotfiles if you use other one |
| `rofi`<br/>`rofi-calc` | Used as application launcher, wifi menu, window switcher, powemenu and calculator |
| `kitty` | The terminal emulator used by default on my configuration, if you rather use another one then reconfigure the dotfiles |
| `brave-bin` | Brave browser so you can use the NightTab extension theme I made, actually it would work on any browser that supports that extension, I don't know if Firefox but at least Chromium-based browsers do |
| `code-minimap` | Dependency to display the braille minimap on vim/neovim with the minimap plugin |
| `flameshot` | Utility to take screenshots, you could use another one but you'll have to change the keybindings on awesomewm dotfiles |
| `fortune-mod` | Used to display the fortunes on the dashboard, useless but it's cool to have it and its a dependency |
| `zsh`<br/>`zsh-autosuggestions`<br/>`zsh-syntax-highlighting`<br/>`zsh-history-substring-search`<br/>`zsh-theme-powerlevel10k-git` | The ZSH shell and all the plugins to make it more usable and eye candy, I don't use OhMyZSH but you're free to do so |
| `unimatrix-git` | This is actually useless, just to display the matrix effect on the terminal but I have an alias for it so it is a dependency, kinda |
| `exa` | Just an <i>ls</i> but on steroids, alike unimatrix-git is not strictly a dependency but I have aliases for it on zsh |
| `Adapta-Nokto-Eta` | The GTK theme I use, then again, use any you like (I hope you don't like light themes 🤢) |
| `ePapirus-Dark` | Icon Pack theme I use, Sweet Line is my favorite but I thought It didn't match a lot with the style of the rice |

I think those are pretty much all of them, if I remember of any that is missing I'll add it.

## I N S T A L L A T I O N&nbsp;&nbsp; &nbsp;&nbsp;'N&nbsp;&nbsp; &nbsp;&nbsp;S E T U P
1. Install all the dependencies
2. Clone this repo and place <u>everything</u> under your home directory (~), EXCEPT the BONUS directory.
3. If you want the LightDM theme:
- Extract the tar.gz file into /usr/share/lightdm-webkit/themes/
- Edit /etc/lightdm/lightdm.conf and set greeter-session to <b>lightdm-webkit2-greeter</b>
- Edit /etc/lightdm/lightdm-webkit2-greeter.conf and set webkit_theme to <b>Eve's Night</b>
- To change a user or session you have to place the mouse over the section that you want to change and press either <kbd>h</kbd> or <kbd>l</kbd>
4. If you want to make some changes to GTK I recommend you to install `lxappearance`, from there you can install and set icon packs, cursor themes and more.
5. The weather widget requires an API key and some coordinates to work, so you can get the API key from [Open Weather](https://openweathermap.org/) and set that on the dashboard lua file (It's a pretty long file so just search for <i>weather</i> and it should be near, far, wherever you are 🎶... ok sorry, but it should be there).
6. The basic keybindings are <kbd>Mod + b</kbd> to toggle the dock and <kbd>Mod + d</kbd> to toggle the dashboard, on the dashboard there's a button with a question mark icon, that will show you all of the other keybindings.

## D O T F I L E S&nbsp;&nbsp; &nbsp;&nbsp;S T R U C T U R E
This section only describes the file structure of Neovim, Rofi and AwesomeWM config directories because are the ones that can get messy, the other ones are pretty straightforward to understand (in my humble opinion).
#### ROFI (~/.config/rofi)
| Directory or file | Description (What you will find here) |
| --- | --- |
| colors/ | There's only one file here, the colorscheme so it becomes easy if you wanna change the colors |
| scripts/ | Shell script files (bash) of additional rofi modis (powermenu and wifi menu) |
| themes/ | Rasi files for each specific modi and also a general file used by default if no other one is specified |
| config.rasi | Document with general setup such as font and icon pack, the configuration within these file are theme independent |
#### NEOVIM (~/.config/nvim)
| Directory or file | Description (What you will find here) |
| --- | --- |
| init.lua | General file that groups all the other ones and sets main configuration such as keybindings, tabs and folding |
| colors/ | Just like in rofi, this directory only contains the colorscheme file for Neovim's Eve's Night theme |
| lua/ | In this directory there are specific configuration files for each plugin (minimap, nvimtree, colorizer, etc.) |
| lua/modules/ | There's only one file here, is the one used to create the statusline |
| pack/default/start/ | Here are located all the github repos of the plugins used and also a simple shell script used to manage them |
#### AWESOMEWM (~/.config/awesome)
| Directory or file | Description (What you will find here) |
| --- | --- |
| bling/ | It's the repo of a set of utilities for the AwesomeWM (tag preview, cool layouts, etc.) |
| components/ | This directory contains configuration of all the elements that are part of the system (dashboard, dock, volume and brightness OSD) |
| libs/ | There's only one file here, which is a json parser, necessary for the weather widget |
| rc.lua | General configuration file that imports all the modules and sets up the wallpaper on each tag |
| theme/ | This directory contains files and configurations for the theme (colorscheme, wallpapers, icons, etc.) |
| utils/ | This directory contains configuration to give functionality to the system (keybindings, rules, notifications, etc.) |

## S C R E E N S H O T S
| [LightDM](https://archlinux.org/packages/community/x86_64/lightdm-webkit2-greeter/) display manager and lock screen |
| --- |
| ![Screenshot](https://lh3.googleusercontent.com/pw/AM-JKLVFIg42_z3i-oorbnpFl2EGRMkuT7oFfXiL8KqwqQieTNG0Xke-Wt1mPkgQcuKxsiD8_iLW-tisF4g6K3FgRHn6dP3G40e4hmJDd3EMRXE1TcRMLXLXKKn20dmzbuCLrfTR-scftkgYTrKzlm2FLFXh=w1337-h671-no?authuser=0) <br/> ![Screenshot](https://lh3.googleusercontent.com/pw/AM-JKLU18mW3YAOm7LdE0TafHb1GALJWAgBewdJX1Vq7vPXMaGC1c2s1ey6w6QcposZ_7nSuWsJQxJ4XzYTZsQdjvxAytXiMLOEzCUpD7QvKvB-FW6kbB9yx6NaOpZDClF799rmCgf6UykpDk4BItnEHribK=w1263-h676-no?authuser=0) |

| [Rofi](https://github.com/davatorium/rofi) application Launcher |
| --- |
| ![Screenshot](https://lh3.googleusercontent.com/pw/AM-JKLVpYHjKHoiStuqD_3LQJgTH54hxrMM_hrioVQzOqxAP8r2zzBlvmpHIqI5N-6cHt-I_7tzXseL1AeaEcU9rXc_tTHBIqomn6BzMJVJEWaCXk0wZIaObDXfRdLITA2naTDmbClUk20qwmTa5BHSPAK_R=w1205-h676-no?authuser=0) |

| [Brave](https://brave.com/) New Tab Theme |
| --- |
| ![Screenshot](https://lh3.googleusercontent.com/pw/AM-JKLU7lqBjVUL-8sWv7Dhu8ZdsMPckXt6in6tG4TxgX6PYps5Jh3y5yySbRB9LYYwh-ZKKtcQHLe93gBDg5uflgpceDQEBrKuY2wuE5mtJe2T53sxcMAvzECY5xJj736JqfdQUOxV1HEdGjUZvt_eBi2Tn=w1220-h676-no?authuser=0) |

| Miscellaneous Screenshots |
| --- |
| ![Screenshot](https://lh3.googleusercontent.com/pw/AM-JKLV5GPVBChokEqSqXRUOQW4jQZMK7ficdSSt3C61rVO8YKqBYTfqGU-mab9AzmymaTxnd3sfS8EbtWv4axCqL9T7hgRcCEq4Xde1q-rQM2kPNRznQInCEnbOSTnselEUTAnZHw2C9fKCfjSXyYq3rkMB=w1203-h676-no?authuser=0) <br/> ![Screenshot](https://lh3.googleusercontent.com/pw/AM-JKLVvnbdisSsCHeb97K6kQtiwuN-SyLeI8xCLBu0vNuBnuyEV3DExGSeB04Wf55oTj_vEgsx0Es31zpk2bwhquelfqfuIFnYK4y-sAdOHlaAv5Z5ztBhH3TrSiXdj3rmWJH8y_wC0PWr26KhFgGDPgbcj=w1203-h676-no?authuser=0) <br/> ![Screenshot](https://lh3.googleusercontent.com/pw/AM-JKLVuvBZCE4ovyQp6emwai-extj06edAT2aiYo4L0odbFdj3p_WvsKLCjYkOMb5IpIueXTtUAQGmbNo4ig4RExAIrCv-UQO93dVw_haA3x6FKZkQQR7Y5rW2lPvnZwmwogPrxadrN7EHZT56t8CZogE9Q=w1206-h676-no?authuser=0) <br/> ![Screenshot](https://lh3.googleusercontent.com/pw/AM-JKLV_KbJB1j6Cw2ws7eitY1oveWfQcAiq9MxGrBOqiCotj4SZ6Gl9DqfirBxSZ6KhIGY2kENBhsgl2YQDtQzfEpSNUxhzdByIfYeojX--F1l6OavO0WIWtG0M3ckyYr555E0-F5hTnwF9TIeqXMYlNMfM=w1203-h676-no?authuser=0) |

## T O D O

I don't know if I'll be maintaining this for too long 'cause it's a massive time investment.

- [ ] Make a better documentation and clean the code (comments, tabs and spaces, variables, etc.)
- [ ] Split the dashboard.lua file into separate ones (one for each widget) cause it's too long and can get messy
- [ ] Hire the real TUX
- [X] Tell everyone I use Arch, BTW
- [ ] Fix some bugs (The ones I'm aware of; if you notice some bug or that there's something wrong with the system don't hesitate and tell me, don't say Lupus cause it's never Lupus)
