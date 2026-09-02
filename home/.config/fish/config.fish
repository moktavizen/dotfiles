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

  alias shis='history | fzf | wl-copy -n'
  alias update='sudo nixos-rebuild switch --upgrade'
  alias vim='nvim'
  alias lazyvim='env NVIM_APPNAME=lazyvim nvim'

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

  function fcut
    ffmpeg -ss $argv[2] -to $argv[3] -i $argv[1] -c copy $argv[4]
  end

end

#
# Export
#

fish_add_path "$HOME/.local/bin"

set -gx MANPAGER 'nvim +Man!'
set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx FZF_DEFAULT_OPTS_FILE "$HOME/.config/fzf/rc"
set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/rc"
