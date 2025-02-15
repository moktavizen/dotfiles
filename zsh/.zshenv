# Env Variable
# ------------------------------------------------------------------------------

# export LIBVA_DRIVERS_PATH=/usr/lib/dri/i965_drv_video.so
export LIBVA_DRIVER_NAME=i965
# export LIBVA_DRIVER_NAME=iHD
export EDITOR=nvim
export VISUAL=nvim
export PATH="$HOME/.local/bin:$PATH"
# export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=gasp -Dsun.java2d.uiScale=2'
# export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=gasp'

# fnm
FNM_PATH="/home/vizen/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/vizen/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# rust
. "$HOME/.cargo/env"

# Go
export GOPATH="$HOME/.go"

# Colors for ls, fd
# export LS_COLORS="$(vivid generate material-darker)"

# Colors for fzf
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#b7b7b7,bg:#171717,hl:#97b4f2
    --color=fg+:#97b4f2,bg+:#2e2e2e,hl+:#97b4f2
    --color=info:#f2d297,prompt:#f2979c,pointer:#cd97f2
    --color=marker:#cdf297,spinner:#cd97f2,header:#97d8f2
    --color=border:#737373
    --no-scrollbar
    --info=hidden
    --height 50%
    --layout reverse
    --border'

