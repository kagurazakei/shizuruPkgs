{
  lib,
  stdenv,
}:
stdenv.mkDerivation rec {
  pname = "Reversal-pink";
  version = "1.0.0";
  src = ./Reversal-pink.tar.gz;

  unpackPhase = ''
    runHook preUnpack
    echo ">>> unpacking ${src}"
    # Extract into $PWD (build directory)
    tar -xzf "$src"
    # If the archive contains a directory, cd into it.
    # Replace the name below if your archive extracts differently.
    cd Reversal-pink
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p "$out/share/icons"
    cp -r Reversal-pink "$out/share/icons/Reversal-pink"
    cp -r Reversal-pink-dark "$out/share/icons/Reversal-pink-dark"
    runHook postInstall
  '';

  meta = with lib; {
    description = "Reversal Pink Icons Theme";
    homepage = "https://github.com/kagurazakei/shizuruPkgs"; # optional
    license = licenses.gpl3Plus; # change if your theme uses another
    platforms = platforms.all;
  };
}
