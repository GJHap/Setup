{ pkgs, ... }: {
  services.swayidle = let
    swaylock = "${pkgs.swaylock}/bin/swaylock";
    swaymsg = "${pkgs.sway}/bin/swaymsg";
  in {
    enable = true;
    events = [{
      command = "${swaylock} -f";
      event = "before-sleep";
    }];
    timeouts = [
      {
        command = ''${swaymsg} "output * dpms off"'';
        resumeCommand = ''${swaymsg} "output * dpms on"'';
        timeout = 300;
      }
      {
        command = "${swaylock} -f";
        resumeCommand = ''${swaymsg} "output * dpms on"'';
        timeout = 360;
      }
    ];
  };
}
