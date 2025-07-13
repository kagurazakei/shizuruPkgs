{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation {
  pname = "catppuccin-icons";
  version = "1.0";

  src = pkgs.fetchFromGitHub {
    owner = "kagurazakei";
    repo = "Catppuccin-SE";
    rev = "4b6b4141300deb9969dc6ab25aaad29430f2439b";
    hash = "sha256-qeC9nZgWTGollQSHz8uuz5K/g2BgHOkjF5QPEZe4er0=";
  };

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r Catppuccin-SE $out/share/icons/
  '';

  meta = with pkgs.lib; {
    description = "Catppuccin-SE icon theme";
    homepage = "https://github.com/catppuccin/catppuccin-icon-theme";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
