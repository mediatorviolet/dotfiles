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

