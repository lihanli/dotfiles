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
    bindkey '^R' history-incremental-search-backward

    # shift + tab
    bindkey '^[[Z' reverse-menu-complete

    # delete
    bindkey '^[[3~' delete-char

    # VI MODE KEYBINDINGS (ins mode)
    bindkey -M emacs '^w'    backward-kill-word
    bindkey -M emacs '^a'    beginning-of-line
    bindkey -M emacs '^e'    end-of-line
    bindkey -M emacs '^K'    kill-whole-line
    bindkey -M emacs '^h'    backward-delete-char
    bindkey -M emacs '^?'    backward-delete-char
    bindkey -M emacs '\eOH'  beginning-of-line # Home
    bindkey -M emacs '\eOF'  end-of-line       # End
  ;;
esac
