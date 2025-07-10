
{ pkgs ? import <nixpkgs> { config.allowUnfree = true; } }:

let
  pythonEnv = pkgs.python3.withPackages (ps: with ps; [
    pywayland
  ]);
in

pkgs.stdenv.mkDerivation {
  pname = "wayland-idle-inhibitor";
  version = "1.0.0";

  src = ./.;

  nativeBuildInputs = [ pkgs.makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin
    install -m755 wayland-idle-inhibitor.py $out/bin/wayland-idle-inhibitor
    wrapProgram $out/bin/wayland-idle-inhibitor \
      --set PYTHONPATH "${pythonEnv}/${pythonEnv.sitePackages}"
  '';

  meta = with pkgs.lib; {
    description = "Wayland idle inhibitor script";
    homepage = "https://github.com/rafaelrc7/wayland-pipewire-idle-inhibit";
    license = licenses.mit;
    maintainers = with maintainers; [ ]; # optional
    platforms = platforms.linux;
    mainProgram = "wayland-idle-inhibitor";
  };
}
