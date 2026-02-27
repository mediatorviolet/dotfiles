# =====================
# COLORS (Gruvbox clean)
# =====================

autoload -Uz colors
colors

C_PATH="%F{#83a598}"
C_GIT="%F{#d3869b}"
C_NODE="%F{#fabd2f}"
C_PHP="%F{#b8bb26}"
C_TIME="%F{#fb4934}"
C_ARROW="%F{#8ec07c}"
C_RESET="%f"

# =====================
# GIT STATUS
# =====================

autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:git:*' enable git
zstyle ':vcs_info:git:*' formats '%b'
zstyle ':vcs_info:*' check-for-changes true

precmd() {
  vcs_info
  CMD_DURATION=$((SECONDS - CMD_START))
}

preexec() {
  CMD_START=$SECONDS
}

git_segment() {
  [[ -z "$vcs_info_msg_0_" ]] && return

  local branch="$vcs_info_msg_0_"
  local dirty=""
  local ahead=0
  local behind=0

  git diff --quiet --ignore-submodules HEAD 2>/dev/null || dirty="✚"

  if git rev-parse @{upstream} >/dev/null 2>&1; then
    ahead=$(git rev-list --count @{upstream}..HEAD 2>/dev/null)
    behind=$(git rev-list --count HEAD..@{upstream} 2>/dev/null)
  fi

  local flags=""
  [[ $ahead -gt 0 ]] && flags+=" ↑$ahead"
  [[ $behind -gt 0 ]] && flags+=" ↓$behind"

  echo " ${C_GIT} ${branch}${dirty}${flags}${C_RESET}"
}

# =====================
# NODE / PHP SMART DETECT
# =====================

node_segment() {
  [[ -f package.json ]] || return
  echo " ${C_NODE} $(node -v 2>/dev/null | sed 's/v//')${C_RESET}"
}

php_segment() {
  [[ -f composer.json || -f artisan ]] || return
  local version=$(php -r "echo PHP_MAJOR_VERSION.'.'.PHP_MINOR_VERSION;" 2>/dev/null)
  echo " ${C_PHP} ${version}${C_RESET}"
}

# =====================
# DURATION
# =====================

duration_segment() {
  (( CMD_DURATION < 2 )) && return

  local seconds=$CMD_DURATION
  local days=$(( seconds / 86400 ))
  local hours=$(( (seconds % 86400) / 3600 ))
  local mins=$(( (seconds % 3600) / 60 ))
  local secs=$(( seconds % 60 ))

  local formatted=""

  (( days > 0 )) && formatted+="${days}d "
  (( hours > 0 )) && formatted+="${hours}h "
  (( mins > 0 )) && formatted+="${mins}m "
  (( secs > 0 )) && formatted+="${secs}s"

  echo " ${C_TIME}⏱ ${formatted}${C_RESET}"
}

# =====================
# PROMPT
# =====================

PROMPT='
${C_PATH}%~${C_RESET}$(git_segment)$(node_segment)$(php_segment)$(duration_segment)
${C_ARROW}❯ ${C_RESET}'
