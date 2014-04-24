case "$TERM" in
  *xterm*|screen-256color)
    # home / end
    bindkey '^[[1~' beginning-of-line
    bindkey '^[[4~' end-of-line

    # history search
    autoload -Uz up-line-or-beginning-search
    autoload -Uz down-line-or-beginning-search
    zle -N up-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey '\eOA' up-line-or-beginning-search
    bindkey '\e[A' up-line-or-beginning-search
    bindkey '\eOB' down-line-or-beginning-search
    bindkey '\e[B' down-line-or-beginning-search

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