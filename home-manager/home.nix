# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # TODO: Set your username
  home = {
    username = "harindu";
    homeDirectory = "/home/harindu";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;

  # Enable home-manager and git
  programs.home-manager.enable = true;

  programs.vim.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;

      # `gnome-extensions list` for a list
      enabled-extensions = [
        "pano@elhan.io"
        "espresso@coadmunkee.github.com"
        "forge@jmmaranan.com"
      ];

      disabled-extensions = [];
    };
  };

  home.packages = with pkgs;
    (with unstable; [
      btop
      alejandra
      firefox
      chromium
      typst
      logseq
      pandoc
      obsidian
      zotero
      sioyek
      telegram-desktop
      whatsapp-for-linux
      thunderbird
      bitwarden
      typst-lsp
      cmus
      lf
      broot
      eza
      zathura
      yt-dlp
      yazi
      wget
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ])
    ++ [
      gnomeExtensions.pano
      gnomeExtensions.espresso
      gnomeExtensions.forge
      gnomeExtensions.appindicator
    ];
  fonts.fontconfig.enable = true;
  programs = {
    zoxide = {
      enable = true;
      package = pkgs.unstable.zoxide;
    };
    starship = {
      enable = true;
      package = pkgs.unstable.starship;
    };
    alacritty = {
      enable = true;
      settings = {
        font.normal.family = "JetBrainsMonoNerdFont";
        font.normal.style = "Regular";
      };
    };
    neovim = {
      enable = true;
      #package = pkgs.unstable.neovim;
      defaultEditor = true;
      plugins = with pkgs.vimPlugins; [
        lightline-vim
        vim-startify
        tokyonight-nvim
      ];
      extraConfig = ''
        set number
        set relativenumber
      '';
      extraLuaConfig = ''
        vim.cmd[[colorscheme tokyonight-night]]
      '';
    };

    fish = {
      enable = true;
      package = pkgs.unstable.fish;
    };
    nushell = {
      enable = true;
      package = pkgs.nushell;
    };
    zellij = {
      enable = true;
      package = pkgs.unstable.zellij;
      enableFishIntegration = true;
    };

    vscode = {
      enable = true;
      package = pkgs.unstable.vscodium;
      extensions = with pkgs.vscode-extensions; [
        kamadorueda.alejandra
        jnoortheen.nix-ide
        nvarner.typst-lsp
        tomoki1207.pdf
      ];
    };

    mpv = {
      enable = true;
      #package = pkgs.unstable.mpv;
      scripts = with pkgs.mpvScripts; [uosc];
      config = {
        profile = "gpu-hq";
        scale = "ewa_lanczossharp";
        cscale = "ewa_lanczossharp";
        video-sync = "display-resample";
        interpolation = "true";
        tscale = "oversample";
      };
    };

    git = {
      enable = true;
      package = pkgs.unstable.git;
      userName = "Harindu Bandara";
      userEmail = "harindudb@gmail.com";
    };
  };

  services = {
    syncthing = {
      enable = true;
    };
  };
}
# warpinator office zathura documentview bitwarden julia obsidian zotero harmonoid sioyek thunderbird telegram whatsapp synthing

