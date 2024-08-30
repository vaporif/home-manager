{ pkgs, ... }: {
  home.username = "vaporif";
  home.homeDirectory = "/Users/vaporif";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    cargo-binstall
    jq
    redis
    go-ethereum
    nixd
    wget
    cmake
    protobuf
    binaryen
    tldr
    hyperfine
    imagemagick
    qemu
    llvm
    pango
    go
  ];

  programs.git = {
    enable = true;
    includes = [{ path = "~/.config/nixpkgs/gitconfig"; }];
  };

  programs.fzf = {
    enable = true;
  };

  programs.nnn = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
  };

  xdg.configFile.nvim.source = ./nvim;
  programs.fd = {
    enable = true;
  };

  programs.eza = {
    enable = true;
  };

  programs.ripgrep = {
    enable = true;
  };

  programs.gh = {
    enable = true;
  };

  programs.bat = {
    enable = true;
  };

  programs.lazygit = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
  };
}
