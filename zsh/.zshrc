# Fetch
fastfetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/moktavizen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# ENV
export LIBVA_DRIVERS_PATH=/usr/lib/dri/i965_drv_video.so
export LIBVA_DRIVER_NAME=i965
# export LIBVA_DRIVER_NAME=iHD
export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=kitty
export PATH="$HOME/.local/bin:$PATH"
# export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=gasp -Dsun.java2d.uiScale=2'
export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=gasp'

# Flutter
export PATH="/usr/bin/flutter/bin:$PATH"
export CHROME_EXECUTABLE="/usr/bin/firefox"

# ADB
export PATH="$HOME/Android/Sdk/platform-tools:$PATH"

# Go
export GOPATH="$HOME/.go"

# deno
. "/home/vizen/.deno/env"

# fnm
FNM_PATH="/home/vizen/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/vizen/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# Colors for ls, fd
# export LS_COLORS="$(vivid generate material-darker)"

# Colors for fzf
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=fg:#eeffff,bg:#212121,hl:#c3e88d
--color=fg+:#82aaff,bg+:#353535,hl+:#82aaff
--color=info:#ffcb6b,prompt:#f07178,pointer:#c792ea
--color=marker:#89ddff,spinner:#c792ea,header:#89ddff'

# Alias needs rg, eza, bat, fd, fzf, to be installed
alias sudo='sudo ' # make sudo detect alias
alias diff='diff --color=auto'
alias grep='rg'
alias ip='ip -color=auto'
alias ls='eza --icons=always --color=always'
alias cat='bat --theme=base16 --color=always --style=plain --paging=never'
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias yay='paru'
alias update='paru'
alias clean='paru --clean'
alias ff='fastfetch'
alias fff='fastfetch -C ~/.config/fastfetch/fastfetch-full.jsonc'
alias shutdown='shutdown -h now'
alias sd='cd $(fd -H -t d | fzf --preview "eza -lh --no-user --no-permissions --icons=always --color=always {}")' # change directory using fzf
alias sf='nvim $(fd -H -t f | fzf --preview "bat --theme=base16 --color=always --style=full --line-range=:100 {}")' # edit file using fzf
alias shis='history 1 | fzf'
alias mdpdf='mdpdf --border=10mm'
alias npx='bunx'
alias vim='nvim'
alias cvim='NVIM_APPNAME=nvchad nvim'
alias lg='lazygit'
alias mp4='yt-dlp -S "res:1080" --remux mp4 --merge mp4 -o "%(title)s - %(uploader)s.%(ext)s"'
function mp3() {
    yt-dlp -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 \
        --embed-metadata --embed-thumbnail --convert-thumb jpg \
        --ppa "ThumbnailsConvertor+FFmpeg_o:-c:v mjpeg -vf crop=\"'min(iw,ih)':'min(iw,ih)'\"" \
        -o "%(title)s - %(artist)s.%(ext)s" \
        "$1"
}
yt_search_play() {
    # Check if required dependencies are installed
    for cmd in fzf mpv yt-dlp jq; do
        if ! command -v "$cmd" &> /dev/null; then
            echo "Error: $cmd is not installed. Please install it first."
            return 1
        fi
    done

    # Function to format duration
    format_duration() {
        local duration=$1
        local hours=$((duration/3600))
        local minutes=$(((duration%3600)/60))
        local seconds=$((duration%60))
        
        if [ $hours -gt 0 ]; then
            printf "%02d:%02d:%02d" $hours $minutes $seconds
        else
            printf "%02d:%02d" $minutes $seconds
        fi
    }

    # Get search query from user if not provided as argument
    local query="$*"
    if [ -z "$query" ]; then
        read -p "Enter search term: " query
    fi

    # Perform YouTube search and format results
    selected=$(yt-dlp ytsearch20:"$query" \
        --get-id --get-title --get-duration \
        --no-playlist \
        --print '%(title)s|||%(duration)s|||%(id)s' 2>/dev/null \
        | while IFS='|||' read -r title duration id; do
            duration_formatted=$(format_duration "$duration")
            printf "%-70.70s  [%s]  https://youtube.com/watch?v=%s\n" \
                "$title" "$duration_formatted" "$id"
        done | fzf --ansi \
            --preview 'yt-dlp --get-description {-1}' \
            --preview-window 'right:40%:wrap' \
            --bind 'ctrl-y:execute(echo {-1} | xclip -selection clipboard)' \
            --header 'TAB/Shift-TAB: Move preview window | Ctrl-Y: Copy URL | Enter: Play video')

    # Check if a video was selected
    if [ -n "$selected" ]; then
        # Extract video URL and play with mpv
        url=$(echo "$selected" | awk '{print $NF}')
        echo "Playing: $url"
        mpv "$url"
    else
        echo "No video selected"
    fi
}
alias ytp='yt_search_play'

# ZSH Theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ZSH Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # must be the last plugin sourced
