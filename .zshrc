# ===================== ENV
# =====================

export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"

export EDITOR=nvim
export LESS='-R'

# =====================
# ALIASES
# =====================

alias ..="cd .."
alias l="ls -la"
alias la="ls -A"
alias ll="ls -alF"
alias mv="mv -i"
alias rm="rm -i"
alias grep="grep --color=auto"
alias ls="ls -G"
alias pa="php artisan"
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias composer="php /usr/local/bin/composer"
alias ffd="fd --no-ignore --hidden"
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# =====================
# PLUGINS
# =====================

# Auto-suggestions
[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Syntax highlighting
[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# FZF key bindings et completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if command -v fzf >/dev/null 2>&1; then
    bindkey '^R' fzf-history-widget
fi

# =====================
# COMPLETION
# =====================

# Initialise le système de complétion
autoload -Uz compinit
compinit -d ~/.zcompdump

# --- Options utiles ---
setopt AUTO_MENU            # menu auto si plusieurs choix
setopt COMPLETE_IN_WORD     # complète au milieu d’un mot
setopt ALWAYS_TO_END        # curseur à la fin après complétion
setopt AUTO_LIST            # liste auto si ambigu
setopt EXTENDED_GLOB

# --- Ignore la casse ---
zstyle ':completion:*' matcher-list \
  'm:{a-z}={A-Za-z}' \
  'r:|=*' \
  'l:|=*'

# --- Menu de sélection stylé ---
zstyle ':completion:*' menu select

# --- Couleurs (reprend LS_COLORS si défini) ---
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# --- Groupement propre ---
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%F{#83a598}%d%f'

# --- Cache plus rapide ---
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/completion-cache

# =====================
# GIT INFO
# =====================

autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst

zstyle ':vcs_info:git:*' formats ' %b'
zstyle ':vcs_info:*' enable git

# =====================
# COLORS
# =====================

FG_MMMM="%F{#32302f}"
FG_RESET="%f"

BG_BROWN="%K{#d65d0e}"
BG_PURPLE="%K{#d3869b}"
BG_BLUE="%K{#83a598}"
BG_GREEN="%K{#b8bb26}"
BG_YELLOW="%K{#fabd2f}"
BG_AQUA="%K{#8ec07c}"
BG_RESET="%k"

# =====================
# FUNCTIONS
# =====================

node_version() {
    node -v 2>/dev/null | sed 's/v//'
}

php_version() {
    php -r "echo PHP_MAJOR_VERSION.'.'.PHP_MINOR_VERSION;" 2>/dev/null
}

# =====================
# PROMPT
# =====================

# Affiche :
# chemin courant | git branch | node version | php version
PROMPT='%B${BG_AQUA}${FG_MMMM} %~ ${FG_RESET}${BG_RESET}${BG_PURPLE}${FG_MMMM} ${vcs_info_msg_0_} ${FG_RESET}${BG_RESET}${BG_YELLOW}${FG_MMMM}  $(node_version) ${FG_RESET}${BG_RESET}${BG_BLUE}${FG_MMMM}  $(php_version) ${FG_RESET}${BG_RESET}
${FG_GREEN}󱞩${FG_RESET}%b '

