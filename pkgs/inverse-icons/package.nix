{
  lib,
  stdenv,
}:
stdenv.mkDerivation rec {
  pname = "inverse-pink-icons";
  version = "1.0.0";
  src = ./Inverse-pink.tar.gz;

  unpackPhase = ''
    runHook preUnpack
    echo ">>> unpacking ${src}"
    # Extract into $PWD (build directory)
    tar -xzf "$src"
    cd Inverse-pink
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p "$out/share/icons"
    cp -r Inverse-pink "$out/share/icons/Inverse-pink"
    cp -r Inverse-pink-dark "$out/share/icons/Inverse-pink-dark"
    runHook postInstall
  '';

  meta = with lib; {
    description = "Inverse Pink Icons Theme";
    homepage = "https://github.com/kagurazakei/shizuruPkgs"; # optional
    license = licenses.gpl3Plus; # change if your theme uses another
    platforms = platforms.all;
  };
}
