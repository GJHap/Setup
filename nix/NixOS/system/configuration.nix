{ config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

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
      efi = { canTouchEfiVariables = true; };
    };
    tmp = { cleanOnBoot = true; };
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
    avahi = {
      enable = true;
      nssmdns = true;
    };
    greetd = {
      enable = true;
      settings = { default_session = { command = "agreety --cmd sway"; }; };
    };
    tlp.enable = true;
    printing.enable = true;
    xserver.libinput.enable = true;
    power-profiles-daemon.enable = false;
    dbus.enable = true;
    geoclue2.enable = true;
  };

  security = {
    pam.services.swaylock = { };
    rtkit.enable = true;
  };

  users.users.ghapgood = {
    isNormalUser = true;
    description = "Gregory Hapgood";
    extraGroups = [ "networkmanager" "wheel" "video" "libvirtd" ];
    shell = pkgs.fish;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
  };

  programs = {
    dconf.enable = true;
    fish.enable = true;
    gnupg = {
      agent = {
        enable = true;
        pinentryFlavor = "qt";
      };
    };
  };

  fonts.packages = with pkgs;
    [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

  virtualisation.libvirtd.enable = true;

  environment = {
    systemPackages = with pkgs; [ greetd.greetd ];
    variables = {
      EDITOR = "nvim";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
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
