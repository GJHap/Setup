{ pkgs, ... }: {
  home.packages = with pkgs; [ sway-audio-idle-inhibit ];
  systemd.user.services = {
    sway-audio-idle-inhibit = {
      Install = { WantedBy = [ "graphical-session.target" ]; };
      Service = {
        ExecStart =
          "${pkgs.sway-audio-idle-inhibit}/bin/sway-audio-idle-inhibit";
        Restart = "on-failure";
      };
      Unit = {
        After = "graphical-session-pre.target";
        PartOf = "graphical-session.target";
      };
    };
  };
}
