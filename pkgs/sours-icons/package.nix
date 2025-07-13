{
  lib,
  stdenv,
}:
stdenv.mkDerivation rec {
  pname = "sours-icons";
  version = "1.0.0";
  src = ./Sours-Full-Color.tar.gz;

  unpackPhase = ''
    runHook preUnpack
    echo ">>> unpacking ${src}"
    # Extract into $PWD (build directory)
    tar -xzf "$src"
    cd Sours-Full-Color
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p "$out/share/icons"
    runHook postInstall
    cp -r . "$out/share/icons/Sours-Full-Color"
  '';

  meta = with lib; {
    description = "Sweet style(sours) Icons Theme";
    homepage = "https://github.com/kagurazakei/shizuruPkgs"; # optional
    license = licenses.gpl3Plus; # change if your theme uses another
    platforms = platforms.all;
  };
}
