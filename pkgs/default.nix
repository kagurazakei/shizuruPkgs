{
  pkgs,
  lib,
  hyprland,
}: {
  hyprscroller = import ./hyprscroller {
    inherit pkgs lib hyprland;
  };

  catppuccin-icons = import ./catppuccin-icons {
    inherit pkgs lib;
  };

  kureiji-ollie-cursors = import ./kureiji-ollie-cursors {
    inherit pkgs lib;
  };

  sddm-stray = import ./sddm-stray {
    inherit pkgs lib;
  };
  nitch = import ./nitch {
    inherit pkgs lib;
  };
  rxfetch = import ./rxfetch {
    inherit pkgs lib;
  };
  gtk-themes = import ./gtk-themes {
    inherit pkgs lib;
  };
  cat-plymouth = import ./cat-plymouth {
    inherit pkgs lib;
  };
  houdoku = import ./houdoku {
    inherit pkgs lib;
  };
  idle-inhibit = import ./idle-inhibit {
    inherit pkgs lib;
  };

  glassy-icons = import ./glassy-icons {
    inherit pkgs lib;
  };
  cyberpunk-icons = import ./cyberpunk-icons {
    inherit pkgs lib;
  };
  reversal-icons = import ./reversal-icons {
    inherit pkgs lib;
  };
  inverse-icons = import ./inverse-icons {
    inherit pkgs lib;
  };

  sours-icons = import ./sours-icons {
    inherit pkgs lib;
  };

  akrata-icons = import ./akrata-icons {
    inherit pkgs lib;
  };
  BeautyLine = import ./BeautyLine {
    inherit pkgs lib;
  };

  mangayomi = import ./mangayomi {
    inherit pkgs lib;
  };
}
