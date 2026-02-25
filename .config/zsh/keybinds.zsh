bindkey -v
KEYTIMEOUT=1

function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
    echo -ne "\e[2 q"
  else
    echo -ne "\e[6 q"
  fi
}
zle -N zle-keymap-select
