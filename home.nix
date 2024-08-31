{pkgs, ... }: {
  home.username = "vaporif";
  home.homeDirectory = "/Users/vaporif";
  home.stateVersion = "22.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    cargo-binstall
    jq
    go-ethereum
    nixd
    wget
    cmake
    protobuf
    tldr
    hyperfine
    imagemagick
    qemu
    llvm
    pango
    go
    nodejs_20
    rustup
  ];

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      shellAliases = {
        lg = "lazygit";
      };
      syntaxHighlighting.enable = true;
      # oh-my-zsh = {
      #   enable = true;
      #   plugins = [ "git" "thefuck" ];
      #   theme = "robbyrussell";
      # };
      initExtra = "${builtins.readFile ./.zshrc}";
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    # nnn = {
    #   enable = true;
    # };

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
}
