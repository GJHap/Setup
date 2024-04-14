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
    systemPackages = with pkgs; [ greetd.greetd ];
    variables = {
      _JAVA_AWT_WM_NONREPARENTING = "1";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
    };
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
        pinentryFlavor = "qt";
      };
    };
  };
  powerManagement = { cpuFreqGovernor = "powersave"; };
  security = {
    pam.services.swaylock = { };
    rtkit.enable = true;
  };
  services = {
    avahi = {
      enable = true;
      nssmdns = true;
    };
    dbus.enable = true;
    geoclue2.enable = true;
    gnome.gnome-keyring.enable = true;
    greetd = {
      enable = true;
      settings = { default_session = { command = "agreety --cmd sway"; }; };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    power-profiles-daemon.enable = false;
    printing.enable = true;
    tlp.enable = true;
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
    config.common.default = "*";
    wlr.enable = true;
  };
}
