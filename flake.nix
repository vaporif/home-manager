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

  outputs = { nixpkgs, home-manager, fzf-git-sh, ... }: let
    arch = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${arch};
    fzf-git-sh-package = pkgs.writeShellScriptBin "fzf-git.sh" (builtins.readFile fzf-git-sh);
  in {
    defaultPackage.${arch} = home-manager.defaultPackage.${arch};
    homeConfigurations.vaporif = 
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${arch};
        modules = [ 
          ./home.nix 
        ];
        extraSpecialArgs = {
          inherit fzf-git-sh-package;
        };
      };
    };
}
