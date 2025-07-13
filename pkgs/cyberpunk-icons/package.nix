{
  lib,
  stdenv,
}:
stdenv.mkDerivation rec {
  pname = "cyberpunk-icons";
  version = "1.0.0";
  src = ./cyberpunk-technotronic-summer-icon-theme.tar.gz;
  unpackPhase = ''
    runHook preUnpack
    echo ">>> unpacking ${src}"
    # Extract into $PWD (build directory)
    tar -xzf "$src"
    # If the archive contains a directory, cd into it.
    # Replace the name below if your archive extracts differently.
    cd cyberpunk-technotronic-summer-icon-theme
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p "$out/share/icons"
    cp -r . "$out/share/icons/cyberpunk-technotronic-summer-icon-theme"
    runHook postInstall
  '';

  meta = with lib; {
    description = "Cyberpunk Dark icon theme";
    homepage = "https://github.com/kagurazakei/shizuruPkgs"; # optional
    license = licenses.gpl3Plus; # change if your theme uses another
    platforms = platforms.all;
  };
}
