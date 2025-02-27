{ pkgs, fzf-git-sh-package, lfcd-sh-package, ... }: {
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.hack
    coreutils
    go-ethereum
    nixd
    wget
    delta
    tldr
    direnv
    bottom
    hyperfine
    pango
    nodejs_22
    (python3.withPackages (ps: with ps; [
      pip
      toml
    ]))
    pnpm
    go
    delve
    rustup
    taplo
    cargo-binstall
    llvm
    gcc
    buf
    protobuf
  ];

  programs = {
    ripgrep.enable = true;
    fd.enable = true;
    gh.enable = true;
    bat.enable = true;
    lazygit.enable = true;
    lf = {
      enable = true;

      keybindings = {
        "." = "set hidden!";
        e = "$$EDITOR $f";
        "f" = null;
        br = "cd ~/Repos/";
        be = "cd ~/Repos/eiger/";
        bm = "cd ~/.config/home-manager/";
      };

      # NOTE: escaping scripts is not cool so just readFile
      extraConfig = builtins.readFile ./lfrc;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        t = "lfcd";
        lf = "lfcd";
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
        source ${lfcd-sh-package}/bin/lfcd.sh
      '';
    };

    git = {
      enable = true;
      userName = "Dmytro Onypko";
      userEmail = "vaporif@gmail.com";
      aliases = {
        co = "checkout";
        cob = "checkout -b";
        discard = "reset HEAD --hard";
        fp = "fetch --all --prune";
      };
      signing = {
        key = "68EFF4350C9C15CD";
        signByDefault = true;
        format = "openpgp";
      };

      extraConfig = {
        pull.ff = "only";
        push.autoSetupRemote = true;
        gui.encoding = "utf-8";
        merge.conflictstyle = "diff3";
        init.defaultBranch = "main";
        rebase.autosquash = true;
        rebase.autostash = true;
        commit.verbose = true;
        diff.colorMoved = true;
        diff.algorithm = "histogram";
        feature.experimental = true;
        help.autocorrect = "prompt";
        branch.sort = "committerdate";
      };
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    nnn = {
      enable = true;
      bookmarks = {
        r = "~/Repos/";
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
  xdg.configFile."lf/icons".source = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/gokcehan/lf/master/etc/icons.example";
    sha256 = "12cwy6kfa2wj7nzffaxn5bka21yjqa5sx38nzdhyg1dq0c6jnjkk";
  };
}
