{
  lib,
  buildNimPackage,
  fetchFromGitHub,
}:
buildNimPackage rec {
  pname = "nitch";
  version = "0.1.6";
  src = ./nitch; # 👈 use the local `nitch` directory
  meta = with lib; {
    description = "Incredibly fast system fetch written in nim";
    homepage = "https://github.com/maotseantonio/nitch";
    license = licenses.mit;
    platforms = platforms.linux;
    mainProgram = "nitch";
  };
}
