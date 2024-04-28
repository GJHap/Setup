{ config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];
  boot = {
    loader = {
      efi = { canTouchEfiVariables = true; };
      systemd-boot = {
        consoleMode = "max";
        editor = false;
        enable = true;
      };
    };
    tmp = { cleanOnBoot = true; };
  };
  environment = {
    systemPackages = with pkgs; [ greetd.greetd vulkan-validation-layers ];
  };
  fonts.packages = with pkgs;
    [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];
  hardware = {
    bluetooth = { enable = true; };
    brillo.enable = true;
    cpu.intel.updateMicrocode = true;
    opengl.enable = true;
    pulseaudio.enable = false;
  };
  i18n.defaultLocale = "en_US.utf8";
  networking = {
    hostName = "ghapgood";
    networkmanager.enable = true;
  };
  nix = {
    extraOptions = "experimental-features = nix-command flakes";
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    package = pkgs.nixStable;
    settings = {
      auto-optimise-store = true;
      allowed-users = [ "ghapgood" ];
    };
  };
  programs = {
    dconf.enable = true;
    fish.enable = true;
    gnupg = {
      agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-gnome3;
      };
    };
  };
  security = {
    pam.services.swaylock = { };
    rtkit.enable = true;
  };
  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
    };
    dbus.enable = true;
    geoclue2.enable = true;
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = ''agreety --cmd "systemd-cat --identifier=sway sway"'';
        };
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      jack.enable = true;
      pulse.enable = true;
    };
    power-profiles-daemon.enable = false;
    printing.enable = true;
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "low-power";
      };
    };
    xserver.libinput.enable = true;
  };
  sound = {
    enable = true;
    mediaKeys.enable = true;
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
  time.timeZone = "America/Chicago";
  users.users.ghapgood = {
    description = "Gregory Hapgood";
    extraGroups = [ "networkmanager" "wheel" "video" "libvirtd" ];
    isNormalUser = true;
    shell = pkgs.fish;
  };
  virtualisation.libvirtd.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gnome ];
    config.common.default = "*";
    wlr.enable = true;
  };
}
