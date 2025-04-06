{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lfcd-sh = {
      url = "https://raw.githubusercontent.com/gokcehan/lf/8bfa3a6d347cad3940d224d14181f58bbf39811e/etc/lfcd.sh";
      flake = false;
    };

    fzf-git-sh = {
      url = "https://raw.githubusercontent.com/junegunn/fzf-git.sh/28b544a7b6d284b8e46e227b36000089b45e9e00/fzf-git.sh";
      flake = false;
    };


    yamb-yazi = {
      url = "github:h-hg/yamb.yazi";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, fzf-git-sh, lfcd-sh, yamb-yazi, ... }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
      fzf-git-sh-package = pkgs.writeShellScriptBin "fzf-git.sh" (builtins.readFile fzf-git-sh);
      lfcd-sh-package = pkgs.writeShellScriptBin "lfcd.sh" (builtins.readFile lfcd-sh);
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
            # easier to install karabiner via brew & hook up configs
            {
              home.file = {
                ".config/karabiner".source = ./karabiner;
              };
            }
          ];
          extraSpecialArgs = {
            inherit fzf-git-sh-package lfcd-sh-package yamb-yazi;
          };
        };
    };
}

