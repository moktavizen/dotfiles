# Fetch
fastfetch

# starship
eval "$(starship init zsh)"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/moktavizen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# flutter
export CHROME_EXECUTABLE="/usr/bin/android-studio"

# ls colors for ls, fd
export LS_COLORS="$(vivid generate material-darker)"

# fzf colorscheme
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
alias cat='bat --theme=base16 --color=always --style=full --paging=never'
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias yay='paru'
alias update='paru'
alias clean='paru --clean'
alias ff='fastfetch'
alias fff='fastfetch -C ~/.config/fastfetch/fastfetch-full.jsonc'
alias shutdown='shutdown -P now'
alias sdir='cd "$(fd -H -t d | fzf --preview "eza -lh --no-user --no-permissions --icons=always --color=always {}")"' # change directory using fzf
alias sfile='nvim "$(fd -H -t f | fzf --preview "bat --theme=base16 --color=always --style=full --line-range=:100 {}")"' # edit file using fzf
alias shis='history 1 | fzf'

# Plugins
source ~/zsh-prompt-benchmark/zsh-prompt-benchmark.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
