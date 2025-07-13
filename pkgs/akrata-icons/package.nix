{
  lib,
  stdenv,
}:
stdenv.mkDerivation rec {
  pname = "akrata-icons-theme";
  version = "1.0.0";
  src = ./akrata-icon.tar.gz;

  unpackPhase = ''
    runHook preUnpack
    echo ">>> unpacking ${src}"
    # Extract into $PWD (build directory)
    tar -xzf "$src"
    # If the archive contains a directory, cd into it.
    # Replace the name below if your archive extracts differently.
    cd akrata-icon
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p "$out/share/icons"
    cp -r akrata-icons "$out/share/icons/akrata-icons"
    cp -r akrata-icons-anarchy "$out/share/icons/akrata-icons-anarchy"
    runHook postInstall
  '';

  meta = with lib; {
    description = "Akarata Icons Theme";
    homepage = "https://github.com/kagurazakei/shizuruPkgs"; # optional
    license = licenses.gpl3Plus; # change if your theme uses another
    platforms = platforms.all;
  };
}
