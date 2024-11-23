{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fzf-git-sh = {
      url = "https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, fzf-git-sh, ... }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
      fzf-git-sh-package = pkgs.writeShellScriptBin "fzf-git.sh" (builtins.readFile fzf-git-sh);
    in
    {
      homeConfigurations.vaporif =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            {
              home = {
                username = "vaporif";
                homeDirectory = "/Users/vaporif";
                stateVersion = "24.05";
              };
            }
            ./home.nix
            # I don't want to use nix-darwin as support is brittle
            # easier to install alacritty + karabiner via brew & hook up configs
            {
              home.file = {
                ".config/alacritty".source = ./alacritty;
                ".config/karabiner".source = ./karabiner;
              };
            }
            {
              xdg.configFile."zellij/config.kdl".text = "${builtins.readFile ./zellij/config.kdl}";
            }
          ];
          extraSpecialArgs = {
            inherit fzf-git-sh-package;
          };
        };
    };
}

