case "$TERM" in
  *xterm*|screen-256color)
    # alt + arrows
    bindkey '[D' backward-word
    bindkey '[C' forward-word
    bindkey '^[[1;3D' backward-word
    bindkey '^[[1;3C' forward-word

    # ctrl + arrows
    bindkey '^[OD' backward-word
    bindkey '^[OC' forward-word
    bindkey '^[[1;5D' backward-word
    bindkey '^[[1;5C' forward-word

    # home / end
    bindkey '^[[1~' beginning-of-line
    bindkey '^[[4~' end-of-line

    # delete
    bindkey '^[[3~' delete-char

    # history search
    bindkey '^[[A' history-beginning-search-backward
    bindkey '^[[B' history-beginning-search-forward

    # shift + tab
    bindkey '^[[Z' reverse-menu-complete

    # VI MODE KEYBINDINGS (ins mode)
    bindkey -M viins '^w'    backward-kill-word
    bindkey -M viins '^a'    beginning-of-line
    bindkey -M viins '^e'    end-of-line
    bindkey -M viins '^K'    kill-whole-line
    bindkey -M viins '\eOH'  beginning-of-line # Home
    bindkey -M viins '\eOF'  end-of-line       # End
  ;;
esac