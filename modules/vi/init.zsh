# Customization for vi mode editor
# zstyle -s ':prezto:module:editor' key-bindings 'vi'

# Change cursor shape in vi `normal` and `insert` mode for iTerm2
function zle-keymap-select zle-line-init {
  case $KEYMAP in
    vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
    viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
  esac

  zle reset-prompt
  zle -R
}

function zle-line-finish {
  print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

# Emulate some emacs keys, 'cause I've gotten used to them
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^d' delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^u' backward-kill-line
bindkey '^r' history-incremental-search-backward

# Remove mode switching delay
export KEYTIMEOUT=1



