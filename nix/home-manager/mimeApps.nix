{ config, ... }: {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = let
      nvim = "nvim.desktop";
      brave = "brave.desktop";
      thunderbird = "thunderbird.desktop";
    in {
      "text/calendar" = [ thunderbird ];
      "text/css" = [ nvim ];
      "text/csv" = [ nvim ];
      "text/html" = [ nvim ];
      "text/javascript" = [ nvim ];
      "text/plain" = [ nvim ];
      "text/vnd.trolltech.linguist" = [ nvim ];
      "application/json" = [ nvim ];
      "application/pdf" = [ brave ];
      "application/x-fishscript" = [ nvim ];
      "application/x-shellscript" = [ nvim ];
      "application/xml" = [ nvim ];
    };
  };
}
