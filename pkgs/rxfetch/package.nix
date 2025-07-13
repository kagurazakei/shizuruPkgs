{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  gitUpdater,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "nerdfetch";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "kagurazakei";
    repo = "rxfetch";
    rev = "8afde062e58be0b318e3823b9ee5e61a8f4f328d";
    hash = "sha256-Aw3UOQfk0mluMhv8WwxUj+TAHVBWzaTpZpZe281A4k0=";
  };

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;
  installPhase = ''
    mkdir -p $out/bin
      cp $src/rxfetch $out/bin
  '';

  passthru.updateScript = gitUpdater {
    rev-prefix = "v";
  };

  meta = with lib; {
    description = "custom system fetching tool writing in bash";
    homepage = "https://github.com/maotseantonio/rxfetch";
    maintainers = with maintainers; [ByteSudoer];
    license = licenses.mit;
    mainProgram = "rxfetch";
    platforms = platforms.unix;
  };
})
