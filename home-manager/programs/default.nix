{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs.unstable; [
    btop
    alejandra
    firefox
    chromium
    vlc
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
    fd
    broot
    eza
    zathura
    yt-dlp
    ffmpeg
    hledger
    imagemagick
    yazi
    wget
    unar
    restic
    (nerdfonts.override {fonts = ["JetBrainsMono"];})

    gimp
    inkscape
    libreoffice
    gthumb
    julia-bin
    bottles
    qMasterPassword
    spectre-cli
    music-player
    termusic
    junction
  ];

  programs = {
    zoxide = {
      enable = true;
      package = pkgs.unstable.zoxide;
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

    vscode = {
      enable = true;
      package = pkgs.unstable.vscode-fhs;
      #extensions = with pkgs.vscode-extensions; [
      #  kamadorueda.alejandra
      #  jnoortheen.nix-ide
      #  nvarner.typst-lsp
      #  tomoki1207.pdf
      #];
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
}
