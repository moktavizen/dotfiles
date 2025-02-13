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

# CLI Env Variable
# ------------------------------------------------------------------------------

# fnm
FNM_PATH="/home/vizen/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/vizen/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

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

# Alias
# ------------------------------------------------------------------------------

# require fzf, rg, eza, bat, fd to be installed
alias sudo='sudo ' # make sudo detect alias
alias diff='diff --color=auto'
# alias grep='rg'
alias ip='ip -color=auto'
alias ls='eza --icons=always --color=always'
# alias cat='bat --theme=base16 --color=always --style=plain --paging=never'
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias yay='paru'
alias update='paru'
alias clean='paru --clean'
alias ff='fastfetch'
alias fff='fastfetch -C ~/.config/fastfetch/fastfetch-full.jsonc'
alias shis='history 1 | fzf'
alias mdpdf='mdpdf --border=10mm'
alias npx='bunx'
alias vim='nvim'
alias lvim='NVIM_APPNAME=lvim nvim'
alias lg='lazygit'
alias media_ser='sudo systemctl start jellyfin'
alias qbit_ser='sudo systemctl start qbittorrent-nox@vizen'
sf() {
  nvim $(
    fd -H -t f | fzf --preview \
      "bat --theme=base16 --color=always --style=numbers,changes {}"
  )
}
sd() {
  cd $(
    fd -H -t d | fzf --preview \
      "eza -lh --no-user --no-permissions --icons=always --color=always {}"
  )
}
fgu() {
  fd -H -t d -g '.git' \
    -E '**/.*/**/.git' \
    -x echo -e '\n{//}' \; -x git -C '{//}' status -s
}
mp4() {
  yt-dlp -S "res:1080" --remux mp4 --merge mp4 \
    -o "%(uploader)s - %(title)s.%(ext)s" "$1"
}
mp3() {
  yt-dlp -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 \
    --embed-metadata --embed-thumbnail --convert-thumb jpg \
    --ppa "ThumbnailsConvertor+FFmpeg_o:-c:v mjpeg -vf crop=\"'min(iw,ih)':'min(iw,ih)'\"" \
    -o "%(artist)s - %(title)s.%(ext)s" "$1"
}

# Source
# ------------------------------------------------------------------------------

# ZSH Theme
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ZSH Plugins
# source ~/zsh-prompt-benchmark/zsh-prompt-benchmark.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Must be the last plugin sourced
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
