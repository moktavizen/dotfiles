# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  nix.optimise = {
    automatic = true;
    dates = [ "15:00" ];
  };
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  networking.hostName = "thicc430";

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Jakarta";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users."vizen" = {
    isNormalUser = true;
    description = "vizen";
    extraGroups = [
      "wheel"
      "video"
    ];
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-vaapi-driver
    ];
  };

  #
  # Packages
  #

  # DE
  services.tlp.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "matrix";
      hide_key_hints = true;
      hide_version_string = true;
    };
  };
  programs.niri.enable = true;
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;
  programs.partition-manager.enable = true;

  # GUI
  programs.chromium.enable = true; # Policies for Brave Browser
  programs.obs-studio.enable = true;

  # CLI
  programs.foot.enable = true;
  programs.fish.enable = true;
  programs.tmux.enable = true;
  programs.git.enable = true;
  programs.neovim.enable = true;
  programs.bat.enable = true;
  programs.lazygit.enable = true;

  # Packages that does not have `.enable` option
  environment.systemPackages = with pkgs; [
    # Theme
    nwg-look
    qt6Packages.qt6ct
    qt6Packages.qtstyleplugin-kvantum
    papirus-icon-theme
    bibata-cursors

    # DE
    quickshell
    btop
    bluetui
    wiremix
    cliphist
    wl-clipboard
    wlsunset
    lxqt.pcmanfm-qt
    lxqt.lximage-qt
    lxqt.lxqt-archiver
    font-manager

    # GUI
    brave
    mpv

    # CLI
    fastfetch
    tree-sitter # arborist.nvim deps
    gcc # arborist.nvim deps
    ripgrep # snacks.picker deps
    fd
    fzf
    eza
    dust
    delta
    github-cli
    dotter

    # Tooling
    nil
    nixfmt-rs
    taplo
    lua-language-server
    stylua
  ];

  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      inter
      nerd-fonts.jetbrains-mono
      source-serif
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
    ];
    fontconfig.defaultFonts = {
      sansSerif = [ "Inter" ];
      monospace = [ "JetBrainsMonoNL Nerd Font Propo" ];
      serif = [ "Source Serif 4" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  system.stateVersion = "26.05";
}
