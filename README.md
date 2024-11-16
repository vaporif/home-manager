# home-manager

This is my personal configuration for nix [home manager](https://github.com/nix-community/home-manager)

I'm using MacOs. This config could be easily migrated to anything nix supports.

# setup

1. Clone this repo
2. Install [homebrew](https://brew.sh/)
3. Install packages via brew
   
```shell
brew bundle
```

It's used only for karabiner and alacritty as nix installation for them is either complicated/brittle.

4. Install [nix](https://nixos.org/download) with [flakes](https://github.com/mschwaig/howto-install-nix-with-flake-support)

6. Install [home-manager](https://github.com/nix-community/home-manager)

Run the initial setup which will build all the derivations which may take a while.

6. Override home manager dir with this repo and install packages in this nix flake
```shell
home-manager switch
```
## Learning

- https://nix.dev/recommended-reading
