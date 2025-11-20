# Fetch
fastfetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${USERNAME:-$(whoami)}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${USERNAME:-$(whoami)}.zsh"
fi

# ZSH Init Config
# ------------------------------------------------------------------------------

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vizen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Keymaps
# ------------------------------------------------------------------------------

bindkey ^y end-of-line
bindkey -s ^f "tmux-sessionizer\n"

# Alias
# ------------------------------------------------------------------------------

# require fzf, fd, eza, bat to be installed
alias sudo='sudo ' # make sudo detect alias
alias diff='diff --color=auto'
alias ip='ip -color=auto'
alias ls='eza --icons=always --color=always'
alias yay='paru'
alias yayf='paru -Slq | fzf --preview "paru -Sii {}" | xargs -ro paru -S'
alias update='paru'
alias clean='paru --clean && paru -Qdttq | paru -Rns --noconfirm -'
alias ff='fastfetch'
alias fff='fastfetch -C ~/.config/fastfetch/fastfetch-full.jsonc'
alias shis='history 1 | fzf'
alias vim='nvim'
alias lazyvim='NVIM_APPNAME=lazyvim nvim'
alias nvchad='NVIM_APPNAME=nvchad nvim'
alias lg='lazygit'
alias start-jellyfin='sudo systemctl start jellyfin'
alias poweroff='pkill chromium && poweroff' # restore chromium session correctly
alias reboot='pkill chromium && reboot'
sf() {
  nvim "$(
    fd -H -t f | fzf --preview \
      "bat --theme=base16 --color=always --style=numbers,changes {}"
  )"
}
sd() {
  cd "$(
    fd -H -t d | fzf --preview \
      "eza -1 --icons=always --color=always {}"
  )"
}
fgu() {
  fd -H -t d -g '.git' -E '**/.*/**/.git' \
    -x echo '{//}' \; \
    -x git -C '{//}' -c color.ui=always status -s
}
mp4() {
  yt-dlp -S "vcodec:h264,res:1080" --remux mp4 --merge mp4 \
    --embed-metadata --embed-thumbnail \
    -o "%(channel)s - %(title)s.%(ext)s" "$1"
}
mp3() {
  yt-dlp -f bestaudio --extract-audio --audio-quality 0 --audio-format mp3 \
    --embed-metadata --embed-thumbnail \
    --ppa "ThumbnailsConvertor+FFmpeg_o:-c:v mjpeg -vf crop='min(iw,ih)':'min(iw,ih)'" \
    -o "%(channel)s - %(title)s.%(ext)s" "$1"
}
encav1() {
  # > Preset value of 6 can give you a good trade-off between quality,
  # > file size, and speed.
  # See https://ottverse.com/analysis-of-svt-av1-presets-and-crf-values/
  #
  # > CRF value of 23 yields a quality level corresponding to CRF 19 for x264,
  # > which would be considered visually lossless.
  # See https://trac.ffmpeg.org/wiki/Encode/AV1/
  #
  ffmpeg -i "$1" -c:v libsvtav1 -preset 6 -crf 23 -c:a libopus -b:a 128k "$2"
}
ench265() {
  # > Preset medium is roughly the same speed as -preset 6 in `libsvtav1`.
  #
  # > The default is 28, and it should visually correspond to libx264
  # > video at CRF 23. That makes CRF 24 corresponds to CRF 19 for x264,
  # > which would be considered visually lossless.
  # See https://trac.ffmpeg.org/wiki/Encode/H.265
  #
  ffmpeg -i "$1" -c:v libx265 -preset medium -crf 24 -c:a libopus -b:a 128k "$2"
}
ench264() {
  # > Preset medium is roughly the same speed as -preset 6 in `libsvtav1`.
  #
  # > CRF 19 for x264,which would be considered visually lossless.
  # See https://trac.ffmpeg.org/wiki/Encode/AV1/
  #
  ffmpeg -i "$1" -c:v libx264 -preset medium -crf 19 -c:a libopus -b:a 128k "$2"
}

# Source
# ------------------------------------------------------------------------------

# ZSH Theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ZSH Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Must be the last plugin sourced
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
