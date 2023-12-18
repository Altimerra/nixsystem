{
  config,
  pkgs,
  ...
}: {
  home.packages =
    (with pkgs.gnomeExtensions; [
      pano
      espresso
      forge
      appindicator
      disable-unredirect-fullscreen-windows
    ])
    ++ (with pkgs; [
      gnome.gnome-tweaks
    ]);

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      favorite-apps = [
        "firefox.desktop"
        "org.gnome.Nautilus.desktop"
        "codium.desktop"
        "Alacritty.desktop"
        "chromium-browser.desktop"
      ];

      # `gnome-extensions list` for a list
      enabled-extensions = [
        "pano@elhan.io"
        "espresso@coadmunkee.github.com"
        "forge@jmmaranan.com"
        "appindicatorsupport@rgcjonas.gmail.com"
      ];

      disabled-extensions = [];
    };

    "org/gnome/mutter" = {
      edge-tiling = true;
      dynamic-workspaces = true;
      workspaces-only-on-primary = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Super>q"];
    };
  };
}
