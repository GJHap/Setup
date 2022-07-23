{ pkgs, lib, ... }:

with pkgs;

let
  swayAudioIdleInhibit = stdenv.mkDerivation {
    version = "0.1.1";
    pname = "SwayAudioIdleInhibit";

    src = fetchFromGitHub {
      owner = "ErikReider";
      repo = "SwayAudioIdleInhibit";
      rev = "v0.1.1";
      sha256 = "XUUUUeaXO7GApwe5vA/zxBrR1iCKvkQ/PMGelNXapbA=";
    };

    strictDeps = true;
    depsBuildBuild = [ pkg-config ];
    nativeBuildInputs = [ meson ninja pkg-config scdoc wayland-scanner cmake ];
    buildInputs = [ wayland wayland-protocols libpulseaudio ];

    meta = {
      homepage = "https://github.com/ErikReider/SwayAudioIdleInhibit";
      description =
        "Prevents swayidle from sleeping while any application is outputting or receiving audio";
      license = lib.licenses.gpl3Plus;
      platforms = lib.platforms.linux;
    };
  };

in {
  options = {
    swayAudioIdleInhibit = lib.mkOption {
      type = lib.types.package;
      description = "";
      default = swayAudioIdleInhibit;
    };
  };
}
