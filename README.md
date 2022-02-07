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

## D E P E N D E N C I E S
| Package | Why is it needed? |
| --- | --- |
| `awesome-git` | Well, its the graphical session the user will be logged in into, <i>ergo</i>, is the base of the system and it's awesome |
| `rofi` | Used as application launcher, wifi menu, calculator, powermenu, etc |
| `lightdm`  <br/>`light-locker`<br/> `lightdm-webkit2-greeter` | Display manager and lock screen (optional if you use another one) |
| `pulseaudio` | Audio input and output management, you could use other one like <i>amixer</i> but you would have to reconfigure the dotfiles |
| `networkmanager` | Network management, you could use other one like <i>netctl</i> but you would have to reconfigure the dotfiles |
| `VictorMono Nerd Font` | Font used by all apps (I personally like it because it makes italics look cursive). Again, you can use other one but you'll have to reconfigure the dotfiles |
| `paru` | Helper to install AUR packages, you could use yay or another one but you'll have to reconfigure the package upgrade information on the dashboard |

## I N S T A L L A T I O N


## D O T F I L E S&nbsp;&nbsp; &nbsp;&nbsp;S T R U C T U R E


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
