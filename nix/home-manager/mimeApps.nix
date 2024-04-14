{ config, ... }: {
  xdg.mimeApps = {
    defaultApplications = let
      nvim = "nvim.desktop";
      brave = "brave.desktop";
      thunderbird = "thunderbird.desktop";
    in {
      "application/json" = [ nvim ];
      "application/pdf" = [ brave ];
      "application/x-fishscript" = [ nvim ];
      "application/x-shellscript" = [ nvim ];
      "application/xml" = [ nvim ];
      "text/calendar" = [ thunderbird ];
      "text/css" = [ nvim ];
      "text/csv" = [ nvim ];
      "text/html" = [ brave ];
      "text/javascript" = [ nvim ];
      "text/markdown" = [ nvim ];
      "text/plain" = [ nvim ];
      "text/vnd.trolltech.linguist" = [ nvim ];
      "x-scheme-handler/http" = [ brave ];
      "x-scheme-handler/https" = [ brave ];
    };
    enable = true;
  };
}
