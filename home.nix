{pkgs, fzf-git-sh-package, ... }: {
  home.username = "vaporif";
  home.homeDirectory = "/Users/vaporif";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    cargo-binstall
    go-ethereum
    nixd
    wget
    protobuf
    tldr
    hyperfine
    qemu
    llvm
    pango
    go
    nodejs_20
    rustup
    coreutils
    buf
    nerdfonts
    delta
  ];

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      shellAliases = {
        lg = "lazygit";
        ls = "eza -a";
      };
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "rust" ];
        theme = "robbyrussell";
      };
      initExtra = ''
        ${builtins.readFile ./.zshrc}
        source ${fzf-git-sh-package}/bin/fzf-git.sh
      '';
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    nnn = {
      enable = true;
      bookmarks = {
        e = "~/Repos/eiger/";
        m = "~/.config/home-manager/";
      };
    };

    neovim = {
      viAlias = true;
      enable = true;
    };

    fd = {
      enable = true;
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
    };

    ripgrep = {
      enable = true;
    };

    gh = {
      enable = true;
    };

    bat = {
      enable = true;
    };

    lazygit = {
      enable = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    zellij = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  xdg.configFile.nvim.source = ./nvim;
  xdg.configFile."zellij/config.kdl".text = "${builtins.readFile ./zellij/config.kdl}";

  # I don't want to use nix-darwin, easier to manage config via manager
  home.file.".config/alacritty".source = ./alacritty;
  home.file.".config/karabiner".source = ./karabiner;
}
