{
  lib,
  fetchFromGitHub,
  flutter,
  mpv,
  rustPlatform,
  stdenv,
  copyDesktopItems,
  makeDesktopItem,
  substituteAll,
}: let
  pname = "mangayomi";
  version = "0.6.30";

  src = fetchFromGitHub {
    owner = "kodjodevf";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-cQ4kNUtOJ6Xc4BRoNLqqOxjbzOAewO3NvCtyAzIvByY=";
  };

  rustDep = rustPlatform.buildRustPackage {
    inherit pname version src;

    sourceRoot = "${src.name}/rust";

    cargoLock = {
      lockFile = "${src}/rust/Cargo.lock";
      # Add any outputHashes if needed for vendored dependencies
    };

    passthru.libraryPath = "lib/librust_lib_mangayomi.so";
  };
in
  flutter.buildFlutterApplication {
    inherit pname version src;

    pubspecLock = lib.importJSON ./pubspec.lock.json;

    patches = [
      (substituteAll {
        src = ./cargokit.patch;
        output_lib = "${rustDep}/${rustDep.passthru.libraryPath}";
      })
    ];

    gitHashes = {
      desktop_webview_window = "sha256-wRxQPlJZZe4t2C6+G5dMx3+w8scxWENLwII08dlZ4IA=";
      flutter_qjs = "sha256-uF3+lQyc6oXWjg9xm8PVXRNZ3AXrw7+FH/lPIQPzaJY=";
      flutter_web_auth_2 = "sha256-3aci73SP8eXg6++IQTQoyS+erUUuSiuXymvR32sxHFw=";
      epubx = "sha256-Rf9zaabPvP7D4NgyJ+LpSB8zHjBvhq2wE0p9Sy7uOXM=";
      media_kit_video = "sha256-t8lqS44lylLhMyvlY5G1k7EXfpDq8WshBVg8D/z0Hbc=";
      re_editor = "sha256-alfzTs9lUHTsaZgXADb1X3T4ZB6KrhIEeGY0wuvZJtU=";
    };

    nativeBuildInputs = [copyDesktopItems];
    buildInputs = [webkitgtk mpv];

    desktopItems = [
      (makeDesktopItem {
        name = pname;
        exec = pname;
        icon = pname;
        desktopName = "Mangayomi";
        comment = "Manga, novel and anime reader";
        categories = ["Utility" "Viewer"];
        keywords = ["Manga" "Anime" "Comics"];
      })
    ];

    postInstall = ''
      install -Dm644 assets/app_icons/icon-red.png $out/share/icons/hicolor/256x256/apps/${pname}.png
      install -Dm644 assets/app_icons/icon-red.png $out/share/pixmaps/${pname}.png
    '';

    meta = with lib; {
      description = "Cross-platform app for reading manga, novels, and watching anime";
      homepage = "https://github.com/kodjodevf/mangayomi";
      license = licenses.asl20;
      maintainers = with maintainers; [kagurazakei];
      platforms = platforms.linux;
      mainProgram = pname;
    };
  }
