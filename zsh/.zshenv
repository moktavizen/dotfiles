# Env Variable
# ------------------------------------------------------------------------------

export EDITOR=nvim
export VISUAL=nvim
export MANPAGER='nvim +Man!'
export PATH="$HOME/.local/bin:$PATH"
# export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=gasp -Dsun.java2d.uiScale=2'
# export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=gasp'

# Colors for ls, fd
# export LS_COLORS="$(vivid generate material-darker)"

# Colors for fzf
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#bebebe,bg:#121212,hl:#97b4f2
    --color=fg+:#97b4f2,bg+:#2e2e2e,hl+:#97b4f2
    --color=info:#f2d297,prompt:#f2979c,pointer:#cd97f2
    --color=marker:#cdf297,spinner:#cd97f2,header:#97d8f2
    --color=border:#717171
    --no-scrollbar
    --info=hidden
    --height 50%
    --layout reverse
    --border'
