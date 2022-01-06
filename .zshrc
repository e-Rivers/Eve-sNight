#   vim:fileencoding=utf-8:foldmethod=marker
#
#   ░▀▀█░░░█▀▀░█░█░█▀▀░█░░░█░░░░░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀
#   ░▄▀░░░░▀▀█░█▀█░█▀▀░█░░░█░░░░░█░░░█░█░█░█░█▀▀░░█░░█░█
#   ░▀▀▀░░░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░░░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀
#
#   Author: Emilio Rivers (e-Rivers)
#   This config is completely free from Oh-My-ZSH

# Powerlevel (Custom Prompt) {{{

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# }}}

# Persistent History Configuration {{{

HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=10000
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE

# }}}

# Insensitive-case autocompletion {{{

autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# }}}

# Zsh Aliases {{{

alias ls="ls --color=auto"
alias lx="exa --icons --grid --all"
alias ll="exa --icons --grid --all --long"
alias lt="exa --icons --grid --all --tree --level 2"
alias matrix="unimatrix -s 90 -c magenta -b -f -l sssssgn"

# }}}

# Zsh Header Decors {{{

"/home/$(whoami)/.termHeaders/$(ls /home/$(whoami)/.termHeaders | shuf -n 1)" 

# }}}

# Zsh Plugins {{{

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# }}}

# Key Bindings {{{

bindkey "^[l" forward-word                      # To go forward a word (and complete autosuggestions)
bindkey "^[h" backward-word                     # To go backwards a word
bindkey "^[b" backward-kill-word                # To delete a word backwards on autosuggestions
bindkey "^[[3~" delete-char                     # To enable supr key 
bindkey "^[k" history-substring-search-up       # To partially search similar commands (Up)
bindkey "^[j" history-substring-search-down     # To partially search similar commands (Down)

# }}}
