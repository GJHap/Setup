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
      options = "--delete-older-than 7d";
    };
    package = pkgs.nixStable;
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
    extraGroups = [ "networkmanager" "wheel" "video" "libvirtd" ];
    shell = pkgs.fish;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-wlr xdg-desktop-portal-gtk ];
  };

  programs = {
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
    dconf.enable = true;
  };

  fonts.fonts = with pkgs;
    [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

  virtualisation.libvirtd.enable = true;

  environment = {
    systemPackages = with pkgs; [
      neovim
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
      rustc
      cargo
      nodejs
      fish
      libreoffice
      fd
      starship
      brillo
      clipman
      wl-clipboard
      wlogout
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
      gnome.adwaita-icon-theme
      capitaine-cursors
      nixos-artwork.wallpapers.nineish-dark-gray
      config.swayAudioIdleInhibit
      stylua
      nixfmt
      gcc
      unzip
      virt-manager
      python3Full
    ];
    variables = {
      EDITOR = "nvim";
      MOZ_ENABLE_WAYLAND = "1";
    };
  };

  system = {
    activationScripts = {
      bash = ''
         ln -sfn ${pkgs.bash}/bin/bash /bin/
         ln -sfn ${pkgs.bash}/bin/bash /usr/bin/
      '';
      ld = ''
        ln -sfn $(cat ${pkgs.stdenv.cc}/nix-support/dynamic-linker) /lib64/
      '';
   };
    stateVersion = "22.05";
  };
}
