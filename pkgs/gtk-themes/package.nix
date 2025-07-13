{pkgs ? import <nixpkgs> {}}: let
  src = pkgs.fetchFromGitHub {
    owner = "kagurazakei";
    repo = "gtk-themes";
    rev = "1078ad881b5fc270482523b51da8b3022b00926d";
    hash = "sha256-2ThCa0gkjs7jFt8BXMJOpXhlNpzKVsx0PJIkgm5Z+eE=";
  };

  mkTheme = themeName:
    pkgs.stdenv.mkDerivation {
      pname = "maotseantonio-${themeName}";
      version = "1.0";
      inherit src;

      installPhase = ''
        mkdir -p $out/share/themes
        cp -r "$src/${themeName}" "$out/share/themes/${themeName}"
      '';

      meta = with pkgs.lib; {
        description = "GTK theme ${themeName} from maotseantonio/gtk-themes";
        homepage = "https://github.com/maotseantonio/gtk-themes";
        license = licenses.mit;
        platforms = platforms.linux;
      };
    };
in {
  CatppuccinMocha-zk = mkTheme "CatppuccinMocha-zk";
  OxoCarbon-zk = mkTheme "OxoCarbon-zk";
  TokyoNight-zk = mkTheme "TokyoNight-zk";
}
