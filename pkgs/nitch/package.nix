{
  stdenv,
  lib,
}:
stdenv.mkDerivation rec {
  pname = "nitch";
  version = "1.0.0"; # or whatever version you want

  src = ./.;

  installPhase = ''
    mkdir -p $out/bin
    cp nitch $out/bin/nitch
    chmod +x $out/bin/nitch
  '';

  meta = with lib; {
    description = "Simple system info tool";
    homepage = "https://github.com/ssleert/nitch.git"; # optional
    license = licenses.mit; # update to correct license if needed
    maintainers = with maintainers; [kagurazakei]; # optional
    platforms = platforms.linux;
  };
}
