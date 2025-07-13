{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation {
  pname = "kureiji-ollie-cursor";
  version = "v2";

  src = pkgs.fetchFromGitHub {
    owner = "kagurazakei";
    repo = "kureiji-ollie-cursors";
    rev = "a68837f6fb2bf30efb12b62f395e9897384cb9db";
    hash = "sha256-LzXB+FwaIsaO76Iv+rcnrNx4YiUpSzLxJvuKU83MMGA=";
  };

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r Kureiji-Ollie-v2 $out/share/icons/
  '';

  meta = with pkgs.lib; {
    description = "Kureiji Ollie v2 custom cursor theme";
    homepage = "https://github.com/maotseantonio/Kureiji-Ollie-Cursors";
    license = licenses.free;
    platforms = platforms.all;
  };
}
