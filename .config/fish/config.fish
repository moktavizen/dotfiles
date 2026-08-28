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

  #
  # Alias
  #

  # Require fzf, fd, eza, bat to be installed
  alias ls='eza -1 --icons=always --color=always'
  alias shis='history | fzf | wl-copy -n'
  alias vim='nvim'
  alias lazyvim='env NVIM_APPNAME=lazyvim nvim'
  alias nvchad='env NVIM_APPNAME=nvchad nvim'
  alias lg='lazygit'

  function sf
    set file (fd -H -t f -E '.git' | fzf)
    if test -n "$file"
      nvim "$file"
    end
  end

  function sd
    set dir (fd -H -t d -E '.git' | fzf)
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

set -gx LS_COLORS (dircolors -c | string split ' ')[3]

set -gx FZF_DEFAULT_OPTS_FILE "$HOME/.config/fzf/rc"
set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/rc"
