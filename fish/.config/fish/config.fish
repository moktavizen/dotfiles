if status is-interactive
  # Commands to run in interactive sessions can go here

  #
  # Theme
  #

  set --global fish_color_autosuggestion brblack
  set --global fish_color_cancel red
  set --global fish_color_command blue
  set --global fish_color_comment brblack
  set --global fish_color_cwd green
  set --global fish_color_cwd_root
  set --global fish_color_end cyan
  set --global fish_color_error red
  set --global fish_color_escape white
  set --global fish_color_gray brblack
  set --global fish_color_history_current
  set --global fish_color_host blue
  set --global fish_color_host_remote green
  set --global fish_color_keyword magenta
  set --global fish_color_normal white
  set --global fish_color_operator cyan
  set --global fish_color_option green
  set --global fish_color_param white
  set --global fish_color_quote green
  set --global fish_color_redirection cyan
  set --global fish_color_search_match --background=brblack
  set --global fish_color_selection --background=brblack
  set --global fish_color_status red
  set --global fish_color_user cyan
  set --global fish_color_valid_path
  set --global fish_pager_color_completion white
  set --global fish_pager_color_description brblack
  set --global fish_pager_color_prefix cyan
  set --global fish_pager_color_progress brblack
  set --global fish_pager_color_selected_background
  set --global fish_pager_color_selected_completion
  set --global fish_pager_color_selected_description
  set --global fish_pager_color_selected_prefix

  #
  # Prompt
  #

  set -g fish_greeting

  set -g fish_prompt_pwd_full_dirs 2
  set -g __fish_git_prompt_show_informative_status true
  set -g __fish_git_prompt_showcolorhints true
  set -g __fish_git_prompt_showstashstate true
  set -g __fish_git_prompt_showuntrackedfiles true
  set -g __fish_git_prompt_char_stateseparator ' '
  set -g __fish_git_prompt_char_dirtystate '*'
  set -g __fish_git_prompt_char_invalidstate '#'
  set -g __fish_git_prompt_char_stagedstate '+'
  set -g __fish_git_prompt_char_stashstate '$'
  set -g __fish_git_prompt_char_untrackedfiles '%'

  function fish_prompt
    # Only add an empty line if this is NOT the first time the prompt is drawn
    if set -q __prompt_initialized
      echo
    else
      set -g __prompt_initialized 1
    end

    set_color magenta
    echo -n (prompt_pwd)
    echo -n (fish_git_prompt " %s")

    echo
    set_color magenta
    echo -n '> '
  end

  #
  # Keybind
  #

  bind \cy end-of-line
  bind \cf 'commandline "tmux-sessionizer"; commandline -f execute'

  #
  # Alias
  #

  # Require fzf, fd, eza, bat to be installed
  alias grep='grep --color=auto'
  alias diff='diff --color=auto'
  alias ip='ip -color=auto'
  alias ls='eza -1 --icons=always --color=always'
  alias yayf='yay -Slq | fzf --preview "yay -Sii {}" | xargs -ro yay -S'
  alias update='yay'
  alias clean='yay -Qdttq | yay -Rns --noconfirm -'
  alias ff='fastfetch'
  alias fff='fastfetch -C ~/.config/fastfetch/fastfetch-full.jsonc'
  alias shis='history | fzf'
  alias vim='nvim'
  alias lazyvim='env NVIM_APPNAME=lazyvim nvim'
  alias nvchad='env NVIM_APPNAME=nvchad nvim'
  alias lg='lazygit'

  function sf
    set file (fd -H -t f -E '.git' | fzf --preview "bat --theme=base16 --color=always --style=numbers,changes {}")
    if test -n "$file"
      nvim "$file"
    end
  end

  function sd
    set dir (fd -H -t d -E '.git' | fzf --preview "eza -1 --icons=always --color=always {}")
    if test -n "$dir"
      cd "$dir"
    end
  end

  function fgu
    fd -H -t d -g '.git' -E '**/.*/**/.git' \
      -x echo '{//}' ';' \
      -x git -C '{//}' -c color.ui=always status -s
  end

  function mp4
    yt-dlp -S "vcodec:h264,res:1080" --remux mp4 --merge mp4 \
      --embed-metadata --embed-thumbnail \
      -o "%(channel)s - %(title)s.%(ext)s" $argv[1]
  end

  function mp3
    yt-dlp -f bestaudio --extract-audio --audio-quality 0 --audio-format mp3 \
      --embed-metadata --embed-thumbnail \
      --ppa "ThumbnailsConvertor+FFmpeg_o:-c:v mjpeg -vf crop=\"'min(iw,ih)':'min(iw,ih)'\"" \
      -o "%(channel)s - %(title)s.%(ext)s" $argv[1]
  end

  function encav1
    # > Preset value of 6 can give you a good trade-off between quality,
    # > file size, and speed.
    # See https://ottverse.com/analysis-of-svt-av1-presets-and-crf-values/
    #
    # > CRF value of 23 yields a quality level corresponding to CRF 19 for x264,
    # > which would be considered visually lossless.
    # See https://trac.ffmpeg.org/wiki/Encode/AV1/
    #
    ffmpeg -i $argv[1] -c:v libsvtav1 -preset 6 -crf 23 -c:a libopus -b:a 128k $argv[2]
  end

  function ench265
    # > Preset medium is roughly the same speed as -preset 6 in `libsvtav1`.
    #
    # > The default is 28, and it should visually correspond to libx264
    # > video at CRF 23. That makes CRF 24 corresponds to CRF 19 for x264,
    # > which would be considered visually lossless.
    # See https://trac.ffmpeg.org/wiki/Encode/H.265
    #
    ffmpeg -i $argv[1] -c:v libx265 -preset medium -crf 24 -c:a libopus -b:a 128k $argv[2]
  end

  function ench264
    # > Preset medium is roughly the same speed as -preset 6 in `libsvtav1`.
    #
    # > CRF 19 for x264,which would be considered visually lossless.
    # See https://trac.ffmpeg.org/wiki/Encode/AV1/
    #
    ffmpeg -i $argv[1] -c:v libx264 -preset medium -crf 19 -c:a libopus -b:a 128k $argv[2]
  end

end

#
# Export
#

fish_add_path "$HOME/.local/bin"

set -gx MANPAGER 'nvim +Man!'
set -gx EDITOR nvim
set -gx VISUAL nvim

# From `dircolors -b`
# Colors for fd, dust, tree, etc
set -gx LS_COLORS 'rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.7z=01;31:*.ace=01;31:*.alz=01;31:*.apk=01;31:*.arc=01;31:*.arj=01;31:*.bz=01;31:*.bz2=01;31:*.cab=01;31:*.cpio=01;31:*.crate=01;31:*.deb=01;31:*.drpm=01;31:*.dwm=01;31:*.dz=01;31:*.ear=01;31:*.egg=01;31:*.esd=01;31:*.gz=01;31:*.jar=01;31:*.lha=01;31:*.lrz=01;31:*.lz=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.lzo=01;31:*.pyz=01;31:*.rar=01;31:*.rpm=01;31:*.rz=01;31:*.sar=01;31:*.swm=01;31:*.t7z=01;31:*.tar=01;31:*.taz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tgz=01;31:*.tlz=01;31:*.txz=01;31:*.tz=01;31:*.tzo=01;31:*.tzst=01;31:*.udeb=01;31:*.war=01;31:*.whl=01;31:*.wim=01;31:*.xz=01;31:*.z=01;31:*.zip=01;31:*.zoo=01;31:*.zst=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.jxl=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:'

set -gx FZF_DEFAULT_OPTS "\
--color=16 \
--color=fg:#c1c1c1,bg:#131313,bg+:#2c2c2c,border:#717171 \
--no-scrollbar \
--layout reverse \
--border"
