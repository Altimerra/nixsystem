{
  config,
  pkgs,
  ...
}: {
  home.shellAliases = {
    g = "git";
    l = "eza";
    ll = "eza -l";
    led = "hledger -f ~/Data/Briefcase/Finance/hledger.journal";
  };

  programs = {
    #starship = {
    #  enable = true;
    #  package = pkgs.unstable.starship;
    #  settings = {
    #    character = {
    #      success_symbol = "[➜](bold green)";
    #      error_symbol = "[➜](bold red)";
    #    };
    #    format = ''
    #      $all
    #    '';
    #  };
    #};

    #powerline-go = {
    #  enable = true;
    #  newline = true;
    #  modules = ["ssh" "cwd" "gitlite"];
    #  settings = {
    #    hostname-only-if-ssh = true;
    #    numeric-exit-codes = true;
    #    cwd-mode = "semifancy";
    #  };
    #};

    oh-my-posh = {
      enable = true;
      useTheme = "emodipt-extend";
    };

    fish = {
      enable = true;
      package = pkgs.unstable.fish;
    };

    nushell = {
      enable = true;
      package = pkgs.unstable.nushell;
      configFile = {
        text = ''
          let $config = {
          }

          def yt [link?: string] {
            if ($link == null) {
              yt-dlp -S res:1080,vcodec:av01,vcodec:avc,acodec:opus,acodec:aac -a "download.txt"
            } else {
              yt-dlp -S res:1080,vcodec:av01,vcodec:avc,acodec:opus,acodec:aac $link
            }
          }

          def i [pkg: string] {
            nu -c $'nix shell nixpkgs-unstable#($pkg)'
          }
        '';
      };
    };

    zellij = {
      enable = true;
      package = pkgs.unstable.zellij;
      enableFishIntegration = true;
    };
  };
}
