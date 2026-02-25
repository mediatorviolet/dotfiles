# =====================
# COLORS (Gruvbox)
# =====================

FG_MMMM="%F{#32302f}"
FG_RESET="%f"
BG_AQUA="%K{#8ec07c}"
BG_PURPLE="%K{#d3869b}"
BG_BLUE="%K{#83a598}"
BG_GREEN="%K{#b8bb26}"
BG_YELLOW="%K{#fabd2f}"
BG_RED="%K{#fb4934}"
BG_RESET="%k"

# =====================
# GIT STATUS
# =====================

autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:git:*' enable git
zstyle ':vcs_info:git:*' formats '%b'
zstyle ':vcs_info:git:*' actionformats '%b|%a'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '●'
zstyle ':vcs_info:git:*' unstagedstr '✚'

precmd() {
  vcs_info
  CMD_DURATION=$((SECONDS - CMD_START))
}

preexec() {
  CMD_START=$SECONDS
}

git_segment() {
  if [[ -n "$vcs_info_msg_0_" ]]; then
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    local status=$(git status --porcelain 2>/dev/null)

    local dirty=""
    [[ -n "$status" ]] && dirty="✚"

    local ahead=$(git rev-list --count @{upstream}..HEAD 2>/dev/null)
    local behind=$(git rev-list --count HEAD..@{upstream} 2>/dev/null)

    local flags=""
    [[ $ahead -gt 0 ]] && flags+="↑$ahead"
    [[ $behind -gt 0 ]] && flags+="↓$behind"

    echo "${BG_PURPLE}${FG_MMMM}  $branch $dirty $flags ${FG_RESET}${BG_RESET}"
  fi
}

# =====================
# NODE / PHP SMART DETECT
# =====================

node_segment() {
  [[ -f package.json ]] || return
  echo "${BG_YELLOW}${FG_MMMM}  $(node -v | sed 's/v//') ${FG_RESET}${BG_RESET}"
}

php_segment() {
  [[ -f composer.json ]] || return
  echo "${BG_BLUE}${FG_MMMM}  $(php -r 'echo PHP_MAJOR_VERSION.\".\".PHP_MINOR_VERSION;') ${FG_RESET}${BG_RESET}"
}

# =====================
# DURATION
# =====================

duration_segment() {
  [[ $CMD_DURATION -gt 2 ]] || return
  echo "${BG_RED}${FG_MMMM} ⏱ ${CMD_DURATION}s ${FG_RESET}${BG_RESET}"
}

# =====================
# PROMPT
# =====================

PROMPT='%B${BG_AQUA}${FG_MMMM} %~ ${FG_RESET}${BG_RESET}$(git_segment)$(node_segment)$(php_segment)$(duration_segment)
${FG_GREEN}❯ ${FG_RESET}%b '
