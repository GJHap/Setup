{ config, pkgs, ... }: {
  imports = [
    ./greetd.nix
    ./swayAudioIdleInhibit.nix
    ./wallpaper.nix
    ./swayDisplayReloadFix.nix
    ./hardware-configuration.nix
  ];

  nix = {
    settings = {
      auto-optimise-store = true;
      allowed-users = [ "ghapgood" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
        consoleMode = "max";
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
    cleanTmpDir = true;
  };

  networking = {
    hostName = "ghapgood";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.utf8";

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
    cpu.intel.updateMicrocode = true;
    opengl.enable = true;
    pulseaudio.enable = false;
    brillo.enable = true;
  };

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    tlp.enable = true;
    printing.enable = true;
    avahi.enable = true;
    xserver.libinput.enable = true;
    power-profiles-daemon.enable = false;
    dbus.enable = true;
  };

  security.rtkit.enable = true;
  users.users.ghapgood = {
    isNormalUser = true;
    description = "Gregory Hapgood";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    shell = pkgs.fish;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-wlr xdg-desktop-portal-gtk ];
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  fonts.fonts = with pkgs; [ (nerdfonts.override { fonts = [ "Mononoki" ]; }) ];

  environment = {
    systemPackages = with pkgs; [
      neovim-nightly
      firefox
      thunderbird
      bluez
      pavucontrol
      pamixer
      playerctl
      wezterm
      xfce.thunar
      fzf
      ripgrep
      git
      gh
      rustup
      nodejs
      fish
      libreoffice
      fd
      starship
      brillo
      clipman
      wl-clipboard
      wlogout
      spotify
      sway
      wayland
      wofi
      waybar
      swayidle
      swaylock
      xwayland
      dunst
      grim
      slurp
      wob
      greetd.greetd
      greetd.gtkgreet
      dracula-theme
      glib
      gnome3.adwaita-icon-theme
      capitaine-cursors
      nixos-artwork.wallpapers.nineish-dark-gray
      config.swayAudioIdleInhibit
      stylua
      nixfmt
      clang
      unzip
    ];
    variables = {
      EDITOR = "nvim";
      MOZ_ENABLE_WAYLAND = "1";
    };
  };

  system.stateVersion = "22.05";
}
