{
  lib,
  stdenv,
}:
stdenv.mkDerivation rec {
  pname = "cool-dark-icons";
  version = "1.0.0"; # bump when you update the tarball

  # ── 1. Source ────────────────────────────────────────────────
  # The tarball is stored right next to this file.
  src = ./Cool-Dark-Icons.tar.gz;

  # ── 2. Explicit unpack phase (tar could do it automatically,
  #     but you asked for a custom extract function) ────────────
  unpackPhase = ''
    runHook preUnpack
    echo ">>> unpacking ${src}"
    # Extract into $PWD (build directory)
    tar -xzf "$src"
    # If the archive contains a directory, cd into it.
    # Replace the name below if your archive extracts differently.
    cd Cool-Dark-Icons
    runHook postUnpack
  '';

  # ── 3. Install: copy to $out/share/icons so desktops can find it ─────
  installPhase = ''
    runHook preInstall
    mkdir -p "$out/share/icons"
    cp -r . "$out/share/icons/Cool-Dark-Icons"
    runHook postInstall
  '';

  meta = with lib; {
    description = "Cool Dark icon theme";
    homepage = "https://github.com/your‑username/cool‑dark‑icons"; # optional
    license = licenses.gpl3Plus; # change if your theme uses another
    platforms = platforms.all;
  };
}
