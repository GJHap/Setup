{ pkgs, ... }: {
  services.swayidle = let
    swaylock = "${pkgs.swaylock}/bin/swaylock";
    swaymsg = "${pkgs.sway}/bin/swaymsg";
  in {
    enable = true;
    events = [{
      event = "before-sleep";
      command = "${swaylock} -f";
    }];
    timeouts = [
      {
        timeout = 300;
        command = ''${swaymsg} "output * dpms off"'';
        resumeCommand = ''${swaymsg} "output * dpms on"'';
      }
      {
        timeout = 360;
        command = "${swaylock} -f";
        resumeCommand = ''${swaymsg} "output * dpms on"'';
      }
    ];
  };
}
