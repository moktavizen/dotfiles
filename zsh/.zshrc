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

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# flutter
export PATH="/usr/bin/flutter/bin:$PATH"
export CHROME_EXECUTABLE="/usr/bin/vivaldi-stable"

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
alias shutdown='shutdown -h now'
alias sdir='cd "$(fd -H -t d | fzf --preview "eza -lh --no-user --no-permissions --icons=always --color=always {}")"' # change directory using fzf
alias sfile='nvim "$(fd -H -t f | fzf --preview "bat --theme=base16 --color=always --style=full --line-range=:100 {}")"' # edit file using fzf
alias shis='history 1 | fzf'
alias mdpdf='mdpdf --border=10mm'
alias npm='bun'
alias npx='bunx'

# p10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # must be the last sourced
