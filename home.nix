{pkgs, ethereum-nix-pkgs, fzf-git-sh-package, ... }: {
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
    llvm
    pango
    go
    nodejs_20
    rustup
    coreutils
    buf
    nerdfonts
    delta
    direnv
    pnpm
    bottom
    ethereum-nix-pkgs.reth
  ];

  programs = {
    ripgrep.enable = true;
    fd.enable = true;
    gh.enable = true;
    bat.enable = true;
    lazygit.enable = true;

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        lg = "lazygit";
        ls = "eza -a";
        cat = "bat";
      };
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

    eza = {
      enable = true;
      enableZshIntegration = true;
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

  # I don't want to use nix-darwin as support is brittle
  # easier to install alacritty + karabiner via brew & hook up configs
  home.file.".config/alacritty".source = ./alacritty;
  home.file.".config/karabiner".source = ./karabiner;
}
