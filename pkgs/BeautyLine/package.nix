{
  lib,
  stdenv,
}:
stdenv.mkDerivation rec {
  pname = "BeautyLine";
  version = "1.0.0";
  src = ./BeautyLine.tar.gz;

  unpackPhase = ''
    runHook preUnpack
    echo ">>> unpacking ${src}"
    # Extract into $PWD (build directory)
    tar -xzf "$src"
    # If the archive contains a directory, cd into it.
    # Replace the name below if your archive extracts differently.
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p "$out/share/icons"
    cp -r BeautyLine "$out/share/icons/BeautyLine"
    runHook postInstall
  '';

  meta = with lib; {
    description = "BeautyLine Icons Theme";
    homepage = "https://github.com/kagurazakei/shizuruPkgs"; # optional
    license = licenses.gpl3Plus; # change if your theme uses another
    platforms = platforms.all;
  };
}
